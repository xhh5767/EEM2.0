インストール
```
wget https://github.com/atusiniida/EEM2.0/archive/master.zip  
unzip  master.zip    
mv EEM2.0-master EEM2.0  
```

EEMを発現データA.tab、遺伝子セットデータA.gmtに適用
```
perl EEM2.0/perl/eem.pl  A.tab B.gmt
```

テストデータを使うと
```
 perl EEM2.0/perl/eem.pl EEM2.0/data/coadExp3000.tab  EEM2.0/data/hallmark.gmt
```
A＿B.eemができる

以下のように各行にmodule の情報がはいっている

><font color="Red">HALLMARK_EPITHELIAL_MESENCHYMAL_TRANSITION</font>[tab]     <font color="Blue">39.149765925967408</font>[tab]3[tab]CoherenceBasedEEM absoluteRadius=0.3125 relativeRadius=0.050000000000000003 itrForPvalue2Calculation=300 coreGeneSize=10 <font color="Green">seedGenes=[ABI3BP, ADAM12, ANPEP,...., VCAN]</font> <font color="Orange">moduleGenes=[COL3A1, COL1A2, COL5A2,...., ELN]</font> center=[-0.10535502585313571, -1.7660015061835561, -1.7153470069277423,...., 2.0250583168882716] Pvalue=39.626887180687071 Pvalue1=37.182678226670824 Pvalue2=39.626887180687071

重要なところ  

* <font color="Red">1列目</font>: gene set ID  
* <font color="Blue">2列目</font>: -log10(p-value)  
* <font color="Green">4列目のseedGenes</font>: inputのgene set  
* <font color="Orange">4列目のmoduleGenes</font>: seedGenesのうち共発現しているもの  


module clustering
```
perl EEM2.0/perl/postEEMprocessing.pl   A＿B.eem A.tab
```

-log10(p-value)がX以上のモジュールをcorrelation cutoff Yでクラスタリング、module個数Z未満のクラスターは捨てる (Default: X = 6 Y=0.7 Z =0)
```
perl EEM2.0/perl/postEEMprocessing.pl  -p X -c Y  -m Z A＿B.eem A.tab
```
例えばテストデータを使うと
```
perl EEM2.0/perl/postEEMprocessing.pl  -p 3 -c 0.75 coadExp3000＿hallmark.eem EEM2.0/data/coadExp3000.tab
```


A＿B.posteem (ディレクトリ）の中に以下のファイルができる
* module.tab:  module activity profileのmatrix
* module.pdf: module.tabのヒートマップ colored side barがmodule clusterをしめす。
* module.collapsed.tab:  module activity profileのクラスターをまとめ、activity profileを平均化したたmeta module activity profile
* module.collapsed.pdf: module.collapsed.tabのヒートマップ
* module.gmt：module cluster中のmoduleの情報
* [gene set ID].pdf: 各モジュールのseed genesのヒートマップ　red side barはmodule genesを示す。
