
conda init $SHELL
conda env create --file ./env/mgn.yml

mkdir dep; cd dep

wget http://smplify.is.tue.mpg.de/main/download1 -O smpl.zip
unzip smpl.zip
cp ./smpl/code/models/basicModel_neutral_lbs_10_207_0_v1.0.0.pkl ../assets/neutral_smpl.pkl
rm -rf smpl.zip smpl

git clone https://github.com/Pooya448/dirt.git
cd dirt
pip install .
cd ..

wget https://github-releases.githubusercontent.com/144918193/cfa52f00-023a-11eb-84ac-8197874c3269?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210514%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210514T233350Z&X-Amz-Expires=300&X-Amz-Signature=2179b9a0329b43db83c16f2ac2a49ee72d68eea3211f97ee0fddb82f9cd5fbf3&X-Amz-SignedHeaders=host&actor_id=34579393&key_id=0&repo_id=144918193&response-content-disposition=attachment%3B%20filename%3Dpsbody_mesh-0.1-cp27-cp27mu-linux_x86_64.whl&response-content-type=application%2Foctet-stream -O psbody_mesh_0.1.whl

pip install psbody_mesh_0.1.whl

wget https://datasets.d2.mpi-inf.mpg.de/MultiGarmentNetwork/weights.zip -O weights.zip
unzip weights.zip

mv ./Multi-Garment\ Network/test_data.pkl ../assets/
rsync -a ./Multi-Garment\ Network/ ../
