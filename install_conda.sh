wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
source ~/miniconda/bin/activate
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
# Install the UShER package
conda install -y usher
conda install -y bedtools