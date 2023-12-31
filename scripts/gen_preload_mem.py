# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

import random
import os

def generate_vmem_file(filename, num_bytes):
    with open(filename, 'w') as vmem_file:
        vmem_file.write("/* This code is autogenerated. */\n")
        for byte_index in range(num_bytes):
            if byte_index == 0:
                byte_hex = '10'
            elif byte_index == 1:
                byte_hex = '32'
            else:
                byte_hex = ''.join(random.choice('0123456789ABCDEF') for _ in range(2))  # 2 hex digits for 8 bits
            
            vmem_file.write(f'@{byte_index:02X} {byte_hex}\n')

if __name__ == "__main__":
    # Get the current working directory
    current_directory = os.getcwd()

    # Memory file with 64 bytes (8 words of 8 bits each)
    filename_custom_values = os.path.join(current_directory, "eth_packet_frame.vmem")
    num_bytes_custom_values = 64
    generate_vmem_file(filename_custom_values, num_bytes_custom_values)


