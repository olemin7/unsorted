# -*- coding: utf-8 -*-

import json
import re

from ..Script import Script


class VaryTempWithHeight(Script):
    def __init__(self):
        super().__init__()

    def getSettingDataString(self):
        # Create settings as an object
        settings = {
            'name': 'Vary Temp With Height',
            'key': 'VaryTempWithHeight',
            'metadata': {},
            'version': 2,
            'settings': {
                'start_temperature': {
                    'label': 'Start Temperature',
                    'description': 'Initial nozzle temperature',
                    'unit': '°C',
                    'type': 'int',
                    'default_value': 200
                },
                'start_offset': {
                    'label': 'start offset',
                    'description':  'Adjust temperature each time height param ',                        
                    'unit': 'mm',
                    'type': 'float',
                    'default_value': 0
                },                
                'height_increment': {
                    'label': 'Height Increment',
                    'description': (
                        'Adjust temperature each time height param '
                        'changes by this much'
                    ),
                    'unit': 'mm',
                    'type': 'int',
                    'default_value': 10
                },
                'temperature_increment': {
                    'label': 'Temperature Increment',
                    'description': (
                        'increase temperature by this much with each '
                        'height increment'
                    ),
                    'unit': '°C',
                    'type': 'int',
                    'default_value': -5
                }
            }
        }

        # Dump to json string
        json_settings = json.dumps(settings)
        return json_settings

    def execute(self, data):
        # Grab settings variables
        start_temp = self.getSettingValueByKey('start_temperature')
        height_inc = self.getSettingValueByKey('height_increment')
        temp_inc = self.getSettingValueByKey('temperature_increment')
        start_offset = self.getSettingValueByKey('start_offset')
                
        # Set our command regex
        cmd_re = re.compile((
            r'G[0-9]+\.?[0-9]* X[0-9]+\.?[0-9]* '
            r'Y[0-9]+\.?[0-9]* Z([0-9]+\.?[0-9]*)'
        ))

        # Set initial state
        output = []
        output_line=';Script name: VaryTempWithHeight\n'
        output_line+=';start_temperature: %d\n'%start_temp        
        output_line+=';height_increment: %d\n'%height_inc
        output_line+=';temperature_increment: %d\n'%temp_inc
        output_line+=';start_offset: %f\n'%start_offset        
        output.append(output_line)

        current_temp = start_temp
        started = False                
        next_z=start_offset+height_inc #next step to temp change

        for layer in data:
            output_line = ''
            for line in layer.split('\n'):
                # If we see LAYER:0, this means we are in the main layer code
                if 'LAYER:0' in line:
                    started = True

                # output any comment lines or pre-start lines
                # without modification
                if line.startswith(';') or not started:
                    output_line += '%s\n' % line
                    continue

                # Find the X,Y,Z Line (ex. G0 X60.989 Y60.989 Z1.77)
                match = cmd_re.search(line)

                # If we've found our line
                if match is not None:
                    # Grab the z value
                    new_z = float(match.groups()[0])

                    # If our z value has changed
                    if new_z >= next_z:
                        next_z +=height_inc
                        current_temp+=temp_inc;
                        output_line += ';TYPE:CUSTOM\n'
                        output_line += 'M104 S%d\n' % current_temp
                # output the current line
                output_line += line +'\n'
            # Append the current possibly modified layer to the output
            output.append(output_line)
        return output
