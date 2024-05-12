FROM python:3.8-slim

# 必要なパッケージをインストール
RUN apt-get update && \
	apt-get install -y libgl1-mesa-glx && \
	apt-get install -y libglib2.0-0 && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	pip install --upgrade pip && \
	pip install torch torchvision scipy numpy pandas matplotlib seaborn jupyterlab scikit-learn thop albumentations opencv-python imgaug torchtext nltk gensim portalocker && \
	rm -rf ~/.cache/pip

WORKDIR /
RUN mkdir /work

# execute jupyterlab as a default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]