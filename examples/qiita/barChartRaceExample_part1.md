# �ʂ߂ʂߓ����_�O���t Bar Chart Race ��`���Ă݂悤: ������
```matlab
livescript2markdown('barChartRaceExample_part1','format','qiita');
```


�ŏo�͂��� Markdown �� Qiita �ł̕\��������F[https://qiita.com/eigs/items/62fbc0b6bdc5e7094abf](https://qiita.com/eigs/items/62fbc0b6bdc5e7094abf)




���ӁF�摜�����͕ʓr Drag \& Drop �� Qiita �ɍڂ���K�v������܂��B




�ŋ߂悭�݂邱��ȃv���b�g�F�e�f�[�^�̎��n��ω������ʂƂƂ��ɕ\������v���b�g�ł��B���ԂƂƂ��ɏ��ʂ�����ւ��̂� Bar Chart Race �Ƃ��Ă΂�Ă���i�H�j�悤�ŁA��������Ƃ����ȃf�[�^�̉������݂��܂��B




����� MATLAB �ŏ����Ȃ��̂��A�A�Ƃ������������Ă����C�����܂����̂ŁA����Ă݂܂����B




����͏����҂Ƃ��ĕ`��ɕK�v�ȗv�f��������Ă��邩�̊m�F�����܂��B `barh` �֐��̋@�\���m�F���Ă݂܂��傤�B




<--
**Please drag & drop an image file here**
Filename: **barChartRaceExample_part1_images/image_0.png**
If you want to set the image size use the following command
<img src=" alt="attach:cat" title="attach:cat" width=500px>
-->


# ���_�O���t�̃v���b�g


�܂��͖_�O���t `barh` �������Ă݂܂��B


```matlab
clear; close all
x = 1:5;
y = (1:5)/10;
handle_bar = barh(x,y);
```

<--
**Please drag & drop an image file here**
Filename: **barChartRaceExample_part1_images/figure_0.png**
If you want to set the image size use the following command
<img src=" alt="attach:cat" title="attach:cat" width=500px>
-->



�ȒP�ł��ˁBx ���c�̈ʒu�Ay ���_�̒��������߂܂��B




`barh` ����₱�����̂� `x` ���c����ł̈ʒu�A`y `���Ή�����_�̒����ł���_�B�����I�� `x` �� `y` ���t�]���Ă���悤�Ɋ�����_�B


# �_�O���t�̖_�̈ʒu���w��i�����j


�v���p�e�B�����Ă݂܂��B


```matlab
handle_bar
```
```
handle_bar = 
  Bar �̃v���p�e�B:

    BarLayout: 'grouped'
     BarWidth: 0.8000
    FaceColor: [0 0.4470 0.7410]
    EdgeColor: [0 0 0]
    BaseValue: 0
        XData: [1 2 3 4 5]
        YData: [0.1000 0.2000 0.3000 0.4000 0.5000]

  ���ׂẴv���p�e�B ��\��

```


�_�O���t�̈ʒu�i�c�����j�� `XData` �v���p�e�B�ŕύX�ł������ł��B�Ⴆ�� 2 �� 3 �����ւ��Ă݂܂��B


```matlab
handle_bar.XData = [1,3,2,4,5];
```

<--
**Please drag & drop an image file here**
Filename: **barChartRaceExample_part1_images/figure_1.png**
If you want to set the image size use the following command
<img src=" alt="attach:cat" title="attach:cat" width=500px>
-->



3 �� 2 �̈ʒu���t�]���܂����B


# �_�O���t�̖_�̈ʒu���w��i�����_�j


�����_�i�s�ϓ��Ȉʒu�w��j���ł���΁A���ʂ�����ւ��J�ڂ�\���ł������ȋC�����܂��B




2 �� 2.8 �� 3 �� 2.2 �ɂ��āA�����������\�����Ă݂܂��B


```matlab
handle_bar.XData = [1,2.8,2.2,4,5];
```

<--
**Please drag & drop an image file here**
Filename: **barChartRaceExample_part1_images/figure_2.png**
If you want to set the image size use the following command
<img src=" alt="attach:cat" title="attach:cat" width=500px>
-->

## ������ƈႤ


�ʒu���ς�����̂͂��������������������B�_�̕����ׂ��I 




����� `barh `�֐����C�𗘂����Ă���āA���ꂼ��̖_���d�Ȃ�Ȃ��悤�ɕ`�悷�邽�߂ł��B�܁A�C�����͂킩���ł��Ȃ��B




������ŊJ����ɂ� `BarWidth` �v���p�e�B�ł��B����l�� `0.8` �ł���AMATLAB �ŏ����Ԋu���󂯂Ċe�o�[���\������܂��B���̃v���p�e�B�� `1` �ɐݒ肷��ƁA�o�[���m�����ԂȂ��\������܂��B�Q�ƁF[Bar �̃v���p�e�B](https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.bar-properties.html)


```matlab
handle_bar.BarWidth
```
```
ans = 0.8000
```
\matlabheading{`BarWidth` �v���p�e�B}


�ł͂���������ɂ���΂����̂��B�Ԋu�����傤�ǂP���������ɂ� 0.8 �ł��������̕\���ł����B




�ł͒����I�Ƀf�[�^�̕��ɔ���Ⴗ��悤�� `BarWidth` �̒l��傫������΂����̂ł́H




����Ă݂܂��B�����_�ł�


```matlab
tmp = handle_bar.XData
```
```
tmp = 1x5    
    1.0000    2.8000    2.2000    4.0000    5.0000

```


�Ƃ����ʒu�֌W�Ȃ̂ŁA�ł��߂��ʒu�ɂ���_���m�̋������g���Čv�Z���Ă݂܂��傤�B


```matlab
scaleWidth = min(diff(sort(tmp)))
```
```
scaleWidth = 0.6000
```


`��x sort` ���Ă���̂́A�t�]���Ă邩��ł��B���̒l���g���� `BarWidth` �̒l������l�� 0.8 �̂悤�Ȍ��h���ɂȂ�悤�ɕς��Ă݂܂��B


```matlab
handle_bar.BarWidth = 0.8/scaleWidth;
```

<--
**Please drag & drop an image file here**
Filename: **barChartRaceExample_part1_images/figure_3.png**
If you want to set the image size use the following command
<img src=" alt="attach:cat" title="attach:cat" width=500px>
-->



�����A�ł������ۂ��B




����ŁAy ���̈ʒu�������L���O�i���ʁj�ɊY������悤�� `XData` �v���p�e�B��ύX����΂����ł��ˁB�ʂ߂ʂߑJ�ڂ�����ɂ́A�����L���O�̓���ւ���������}���Ă�����Ƃ����ʂ�����ւ��悤�ɂ���΁A�ʂ߂ʂߑJ�ڂ��\���ł������ȋC�����Ă��܂����I


# ���Ȃǂ̕\��


y ���ɏ����_���\��Ă���̂��C�ɂȂ�܂��̂ŁA���̕��Y��ɂ��Ă݂܂��傤�B




�g���̂� `Axes` �I�u�W�F�N�g�� `YTick` �� `YTickLabel` �ł��B���ꂼ��̖_�̃��x���� 


```matlab
names = ["A","B","C","D","E"];
```


�Ƃ��܂��B�܂��̓��x����\������ʒu `YTick` ���w�肵�܂��B�����L���O�i�ʒu�j�ɑ������� `XData` �v���p�e�B�l�����̂܂ܓ���Ă݂܂��B 


```matlab
handle_axes = gca;
```
```matlab
try
    handle_axes.YTick = handle_bar.XData;
catch ME
    disp(ME.message)
end
```
```
�l�͒P���x�^�܂��͔{���x�^�̃x�N�g���ŁA�l���������Ȃ���΂Ȃ�܂���
```
# YTick �͒P����������Ȃ���


�G���[���ł܂����B`YTick` �ɂ�**�P������**�����l��^���Ȃ��ƃG���[���ł܂��B�\�[�g���Ă����܂��傤�B(��������)


```matlab
[tmp,idx] = sort(handle_bar.XData,'ascend');
```


`XData` �̕��בւ��ɉ����� `names` �̏��Ԃ��ς��Ă����K�v������̂ŁA���o�͈����� `idx` ���g���܂��B


```matlab
handle_axes.YTick = tmp;
handle_axes.YTickLabel = names(idx);
```

<--
**Please drag & drop an image file here**
Filename: **barChartRaceExample_part1_images/figure_4.png**
If you want to set the image size use the following command
<img src=" alt="attach:cat" title="attach:cat" width=500px>
-->



B �� C ������ւ���Ă��銴�����łĂ܂��ˁI


# �c�O�ȓ_�F�F�̖��


`barh` �̎c�O�ȓ_�Ȃ�ł����A1 �� bar �I�u�W�F�N�g�ɑ΂��ĐF��1�F�����w��ł��܂���B




�Ȃ̂ŁA�F�̎�ނ��� `barh` �����s���ĈقȂ� bar �I�u�W�F�N�g�����΂�΂����ł��ˁB


```matlab
figure
x = 1:5;
y1 = [1:4,0]/10;
y2 = [0,0,0,0,5]/10;
handle_bar1 = barh(x,y1);
hold on
handle_bar2 = barh(x,y2);
hold off
```

<--
**Please drag & drop an image file here**
Filename: **barChartRaceExample_part1_images/figure_5.png**
If you want to set the image size use the following command
<img src=" alt="attach:cat" title="attach:cat" width=500px>
-->

# �܂Ƃ�


�����҂͂����܂ŁI�F�̐����� bar �I�u�W�F�N�g�����Ƃ��낢���ς����ł����A�ނ��낢�낢�뎩�R�ɃJ�X�^�}�C�Y�ł��Ă�����������Ȃ��B




�ł������ȋC�����Ă��܂����B���̓T���v���f�[�^���g���ă����L���O�����ڂ���A�j���[�V�����������Ă݂܂��B




��邱�Ƃ͈ȉ���2�_



   -  �����̎��n��f�[�^�̊e���_�ł̒l�̏��ʕt�� 
   -  ���ʂ�����ւ��J�ڕ�����\�����邽�߂̃f�[�^�̓��} 



���ꂪ�ł���΁A���Ƃ� bar �I�u�W�F�N�g�ɒl�����Ă��������ł��B


