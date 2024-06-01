FROM randomdude/gcc-cross-x86_64-elf

RUN apt-get update
RUN apt-get upgrade -y

# Netwide Assembler (NASM), an asssembler for the x86 CPU
RUN apt-get install -y nasm     
# Create ISOs
RUN apt-get install -y xorriso  

RUN apt-get install -y grub-pc-bin
RUN apt-get install -y grub-common

VOLUME /root/env
WORKDIR /root/env

# TO run the docker >> docker run --rm -it -v "$(pwd):/root/env" junior-chupacabra