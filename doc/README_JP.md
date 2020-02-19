
# MATLAB �� Live Script ���� Markdown �ւ̎����ϊ�


Copyright 2020 The MathWorks, Inc.


# �͂��߂�


���� README �� [���C�u�X�N���v�g](https://jp.mathworks.com/help/matlab/matlab_prog/what-is-a-live-script-or-function.html) �� Qiita/Github �� Markdown �Ɏ����ϊ�����֐� `latex2markdown.m` ���g���ďo�͂��ꂽ���̂ł��BLive Editor ��Ŏg����@�\�� GitHub �ł̕\�����m�F���Ă݂Ă��������B


  
## �g����: README.mlx ��ϊ�����ꍇ
### Step 1: Latex �ɕϊ�


![image_0.png](README_JP_images/image_0.png)




LateX �ɏo�͂������_�Ŋ֘A�摜�ilive script ���Ŏg�p�����摜�� Figure) �� `README_images` �Ƃ����t�H���_������A������ɕۑ�����܂��B




**WARNING**: Live script �����s��������ɂ��̂܂܃G�N�X�|�[�g����ƁA�摜�� eps �Ƃ��ďo�͂���A�܂� Figure �������ꍇ�i20�ȏ�j����ꍇ�ɂ̓G���[����������P�[�X���m�F����Ă��܂��B**���s��������� livescript �͂���������A�ēx�J���������� LaTeX �ɏo�͂���ƃG���[�͉���ł��܂��B**




�i�������R�}���h�Ŏ��s������@�͂���܂��i[�Q�l](https://jp.mathworks.com/matlabcentral/answers/396348-how-to-find-and-replace-within-mlx-live-scripts-across-multiple-files)�j��������ł���_���������������j


### Step 2: markdown �ɕϊ�
```matlab
latex2markdown('README');
```


�� GitHub ������ markdown �� README.md ����������܂��B�I�v�V�����͈ȉ��̂Q�B



   -  `'format'`: �p�r�ɍ��킹�� `'github'` (����) �������� `'qiita'` ���w�肵�Ă��������B 
   -  `'outputfilename'`: �w�肵�Ȃ��ꍇ�́Alive script �Ɠ������O`.md` �̃t�@�C������������܂��B 



�Ⴆ�� Qiita ������ QiitaDraft.md �����ꍇ��


```matlab
latex2markdown('README','format','qiita','outputfilename','QiitaDraft');
```


�ł��B


## Qiita �� GitHub �̈Ⴂ


�����Ɖ摜�̎�舵���ł��B������ Qiita �ł� latex ���g�������AGitHub �͎󂯕t���Ȃ��̂ŁACODECOGS ([https://latex.codecogs.com](https://latex.codecogs.com)) ���g�p���Ă��܂��B�܂��摜�̏ꍇ�AGitHub �͉摜�t�H���_�����킹�� Push ����Ε\������܂����AQiita �̏ꍇ�̓G�f�B�^���ŉ��߂� Drag \& Drop ����K�v������܂��B


  
# �Ή�����@�\

# MATLAB Code


MATLAB code �Ǝ��s���ʂ̃v���b�g�͈ȉ��̂悤�ɕ\������܂��B


```matlab
% matlab code 
x = linspace(0,2*pi,100);
y = sin(x)
```
```
y = 1x100    
         0    0.0634    0.1266    0.1893    0.2511    0.3120    0.3717    0.4298    0.4862    0.5406    0.5929    0.6428    0.6901    0.7346    0.7761    0.8146    0.8497    0.8815    0.9096    0.9341    0.9549    0.9718    0.9848    0.9938    0.9989    0.9999    0.9969    0.9898    0.9788    0.9638    0.9450    0.9224    0.8960    0.8660    0.8326    0.7958    0.7557    0.7127    0.6668    0.6182    0.5671    0.5137    0.4582    0.4009    0.3420    0.2817    0.2203    0.1580    0.0951    0.0317

```
```matlab
plot(x,y);
```

![figure_0.png](README_JP_images/figure_0.png)

## �e�[�u���o��


table �^�ϐ��̏o�͈͂ȉ��̂悤�ȕ\���ɂȂ�܂��B


```matlab
array2table(rand(3,4))
```
| |Var1|Var2|Var3|Var4|
|:--:|:--:|:--:|:--:|:--:|
|1|0.6991|0.5472|0.2575|0.8143|
|2|0.8909|0.1386|0.8407|0.2435|
|3|0.9593|0.1493|0.2543|0.9293|



�����A�ȉ��̂悤�ɕϐ��̐��ƃe�[�u���̗񐔂����v���Ă��Ȃ��ꍇ�́A���܂��\������܂���B


```matlab
table(rand(3,4))
```
| |Var1| | | |
|:--:|:--:|:--:|:--:|:--:|
|1|0.3500|0.6160|0.8308|0.9172|
|2|0.1966|0.4733|0.5853|0.2858|
|3|0.2511|0.3517|0.5497|0.7572|



�Z�����}�[�W���ꂽ�\�� markdown �L�ڕ��@������΋����Ă��������B


  
## ���̑��̏o�͌`��


���ׂĂ̌`�����������킯�ł͂Ȃ��̂ŁA�o�͂����G�ɂȂ�Ƃ������܂��\������Ȃ��\��������܂��B��������΁A���萔�ł����R�����g�������� issue �Ƃ��ċ����Ē�����Ə�����܂��B


  

## �R�[�h��Ƃ��Ă� MATLAB Code


���s����Ȃ������邾���� MATLAB code ���ȉ��̒ʂ�B��̋�ʂ����Ȃ��_�ɒ��ӁB


```matlab
% matlab code sample view (���s����Ȃ���j
x = linspace(0,1,100);
y = sin(x);
plot(x,y);
```
# �}�����ꂽ�摜


Live script �ɑ}�����ꂽ�摜�͈ȉ��̒ʂ�B




![image_1.png](README_JP_images/image_1.png)


# ����


Live script �ɑ}�����ꂽ������ latex �`���ŏ����o����܂��B�C�����C���ł̐����B <img src="https://latex.codecogs.com/gif.latex?\inline&space;\sin^2&space;x+\cos^2&space;x=1"/>�B�����s����



<img src="https://latex.codecogs.com/gif.latex?\begin{array}{l}&space;\sin&space;x=-\int&space;\cos&space;xdx\\&space;\cos&space;x=\int&space;\sin&space;xdx&space;\end{array}"/>



�P�s�̐���



<img src="https://latex.codecogs.com/gif.latex?\sin&space;x=-\int&space;\cos&space;xdx"/>

# ���X�g


���X�g���ȉ��̒ʂ�ł��B



   -  ���X�g�P 
   -  ���X�g�Q 
   -  ���X�g�R 



�����t���̃��X�g���\�������Ă݂܂��B



   1.  ���X�gA 
   1.  ���X�gB 
   1.  ���X�gC 

# ��������


Live Editor �őΉ����Ă���g�ݍ��킹��S�����ׂ�ƁF**����**�A*�C�^���b�N*�A�����t�������A`��������`�A***�C�^���b�N����***�A**`��������`**�A**�����t������**�A***�����t���C�^���b�N����***�A***`�����t���C�^���b�N��������`***




���t�������͌����_�Ŗ�������܂��̂ł��������������B


# ���p��


Live Editor �ɂ͈��p�ɊY������@�\�͂Ȃ��̂ł����A�����ɒ����Ɉʒu�ݒ肳�ꂽ���͈͂��p�����ɂ��邱�Ƃɂ��Ă��܂��B


> ���p�����g�����ȁiby michio) 


  
# Feedback


�����C�ɂȂ邱�Ƃ�����Ή����Ȃ��R�����g���������B


