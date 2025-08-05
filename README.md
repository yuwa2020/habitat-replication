# habitat-replication

## Conda environment setting. 
For habitat data download, I simply used this conda library to install packages
```
conda install habitat-sim -c conda-forge -c aihabitat
```
Reference: https://github.com/facebookresearch/habitat-sim?tab=readme-ov-file#installation

(Because my environment.yml is created on an M1 Mac laptop, I think downloading the package from the conda library is better)


After that, I downloaded these two libraries 
```bash
conda install pytorch -c pytorch
pip install opencv-python tqdm
```
Reference: dust3r's habitat datasets_preprocess README: https://github.com/naver/dust3r/tree/main/datasets_preprocess/habitat

## dust 3r Installation

Clone DUSt3R.
```bash
git clone --recursive https://github.com/naver/dust3r
cd dust3r
```


# Rendering code setting

```bash
export METADATA_DIR="/path/to/habitat/5views_v1_512x512_metadata"
export SCENES_DIR="/path/to/habitat/data/scene_datasets/"
export OUTPUT_DIR="data/habitat_processed"
cd datasets_preprocess/habitat/
export PYTHONPATH=$(pwd)
# Print commandlines to generate images corresponding to each scene
python preprocess_habitat.py --scenes_dir=$SCENES_DIR --metadata_dir=$METADATA_DIR --output_dir=$OUTPUT_DIR
# Launch these commandlines in parallel e.g. using GNU-Parallel as follows:
python preprocess_habitat.py --scenes_dir=$SCENES_DIR --metadata_dir=$METADATA_DIR --output_dir=$OUTPUT_DIR | parallel -j 16
```
For our data folder path, I used the following directory path:
```bash
export METADATA_DIR="/nfs/gigantamax/home/data/datasets/Habitat-Sim-metadata"
export SCENES_DIR="/nfs/gigantamax/home/data/datasets/SCENES_DIR"
export OUTPUT_DIR="data/habitat_processed"
cd datasets_preprocess/habitat/
export PYTHONPATH=$(pwd)
# Print commandlines to generate images corresponding to each scene
python preprocess_habitat.py --scenes_dir=$SCENES_DIR --metadata_dir=$METADATA_DIR --output_dir=$OUTPUT_DIR 
# Launch these commandlines in parallel e.g. using GNU-Parallel as follows:
python preprocess_habitat.py --scenes_dir=$SCENES_DIR --metadata_dir=$METADATA_DIR --output_dir=$OUTPUT_DIR | parallel -j 16
```


Reference: dust3r's habitat datasets_preprocess README: https://github.com/naver/dust3r/tree/main/datasets_preprocess/habitat


