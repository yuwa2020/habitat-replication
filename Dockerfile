# Base image with CUDA 11.8 on Ubuntu 22.04
FROM nvcr.io/nvidia/cuda:11.8.0-devel-ubuntu18.04

# Set the frontend to noninteractive to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install all apt dependencies in a single layer
# ADDED: OpenGL development libraries
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    git \
    libgl1-mesa-dev \
    libegl1-mesa-dev \
    libx11-dev \
    parallel \
    libjpeg-dev libglm-dev libgl1-mesa-glx libegl1-mesa-dev mesa-utils xorg-dev freeglut3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

# Add conda to the PATH
ENV PATH="/opt/conda/bin:${PATH}"

ARG PROJECTS_DIR=/home/code

RUN mkdir -p ${PROJECTS_DIR}

# Clone repo before setting up the environment
RUN cd ${PROJECTS_DIR} &&\
    git clone --branch stable https://github.com/facebookresearch/habitat-sim.git

# Accept Conda ToS, then create the environment with newer CMake
RUN conda config --set always_yes true && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r && \
    conda create -n habitat python=3.9 cmake=3.14.0

# Install newer CMake and ninja from conda-forge
RUN conda run -n habitat conda install -c conda-forge cmake>=3.20 ninja

# Activate the conda environment
SHELL ["conda", "run", "-n", "habitat", "/bin/bash", "-c"]

# Install habitat-sim with proper CMake flags and headless mode
RUN cd ${PROJECTS_DIR}/habitat-sim && \
    pip install -r requirements.txt && \
    python setup.py install --headless && \
    conda install -c menpo opencv


# Set the default working directory and command for when the container starts
WORKDIR /nfs/wattrel/data/md0/yuhirata_files/data/dust3r
CMD ["/bin/bash"]

# conda install -c conda-forge opencv   
# conda install -c conda-forge numpy=1.26.4   
    

# Run this code inside the docker
# source activate

# # Clone the repository with submodules in /github
# RUN mkdir -p /github
# WORKDIR /github
# RUN git clone --recursive https://github.com/graphdeco-inria/gaussian-splatting.git
# WORKDIR /github/gaussian-splatting

# # Create the conda environment using the environment.yml from the repo
# RUN conda env create -f environment.yml

# # Activate the environment
# RUN echo "source activate gaussian_splatting" > ~/.bashrc
# ENV PATH /opt/conda/envs/gaussian_splatting/bin:$PATH

# # Set the default command to run when starting the container
# CMD ["bash"]