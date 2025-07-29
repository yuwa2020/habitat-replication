# habitat-replication


```
python -m habitat_sim.utils.datasets_download --username 3663ec833567a9a9 --password 443c9d3c1653cb62e1d40196f345faad --uids hm3d_full --data-path ./
```


```
docker run --gpus all -it --rm -v /nfs/wattrel/data/md0/yuhirata_files/data/dust3r:/nfs/wattrel/data/md0/yuhirata_files/data/dust3r -v /nfs/gigantamax/home/data:/nfs/gigantamax/home/data habitat
```


```
python /nfs/wattrel/data/md0/yuhirata_files/data/dust3r/datasets_preprocess/habitat/preprocess_habitat.py --metadata_filename=/nfs/gigantamax/home/data/datasets/Habitat-Sim-metadata/5views_v1_512x512_metadata/habitat-test-scenes/skokloster-castle/metadata.json --metadata_dir=/nfs/gigantamax/home/data/datasets/Habitat-Sim-metadata --scenes_dir=/nfs/wattrel/data/md0/yuhirata_files/data/dust3r/SCENES_DIR --output_dir=data/habitat_processed/5views_v1_512x512_metadata/habitat-test-scenes/skokloster-castle
```




```
python /nfs/wattrel/data/md0/yuhirata_files/data/dust3r/datasets_preprocess/habitat/preprocess_habitat.py --metadata_filename=/nfs/gigantamax/home/data/datasets/Habitat-Sim-metadata/5views_v1_512x512_metadata/habitat-test-scenes/skokloster-castle/metadata.json --metadata_dir=/nfs/gigantamax/home/data/datasets/Habitat-Sim-metadata --scenes_dir=/nfs/wattrel/data/md0/yuhirata_files/data/dust3r/SCENES_DIR --output_dir=data/habitat_processed/5views_v1_512x512_metadata/habitat-test-scenes/skokloster-castle
```


```
rclone copy IU_OneDrive_root:1-GRADUATE-SCHOOL-DATA/10-Research-Assistanship/3D-reconstruction/2025-07-29/data/datasets/Habitat-Sim-metadata/5views_v1_512x512_metadata/habitat-test-scenes Documents/dust3r/data/datasets/Habitat-Sim-metadata/5views_v1_512x512_metadata/habitat-test-scenes
``` 


```
rclone copy IU_OneDrive_root:1-GRADUATE-SCHOOL-DATA/10-Research-Assistanship/3D-reconstruction/2025-07-29/data/datasets/Habitat-Sim-metadata Documents/dust3r/data/datasets/Habitat-Sim-metadata
```


