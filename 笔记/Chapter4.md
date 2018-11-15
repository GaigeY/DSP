[toc]
# 第四章 快速傅里叶变换（FFT）
快速傅里叶变换（FFT）并不是与DFT不同的另一种变换，而是为了减少计算次数的一种快速有效的算法。

本章主要研究若干中计算离散傅里叶变换的算法：
- 按时间抽取的FFT算法
- 按频率抽取的FFT算法
- N为复合数的FFT算法
- 分裂基FFT算法
- 线性调频z变换算法
- ZFFT算法

着重讨论算法原理，并提供了实现算法的详细细节。
## 一、直接计算DFT的问题和改善DFT运算效率的基本途径
### 直接计算DFT的问题
有限列长为N的序列$x(n)$的DFT对为$$X(k)=\sum_{n=0}^{N-1}x(n)W_N^{nk}\qquad k=0,1,...,N-1$$$$x(n)=\frac1N\sum_{k=0}^{N-1}X(k)W_N^{-nk}\qquad n=0,1,...,N-1$$完成全部DFT的总计算量为$N^2$次复数相乘及$N(N-1)$次复数相加。

DFT实际计算方式为$$X(k)=\sum_{n=0}^{N-1}\{[\mathbf{Re}x(n)\mathbf{Re}W_N^{nk}-\mathbf{Im}x(n)\mathbf{Im}W_N^{kn}]+$$$$\qquad\qquad j[\mathbf{Re}x(n)\mathbf{Im}W_N^{kn}+\mathbf{Im}x(n)\mathbf{Re}W_N{kn}]\}$$运算复杂度为$4N^2$。
### 改善DFT运算效率的基本途径
$W_N^{kn}$的固有特性：
1. $W_N^{kn}$的对称性$$W_N^{k(N-n)}=W_N^{-kn}=(W_N^{kn})^* .$$
2. $W_N^{kn}$的周期性$$W_N^{kn}=W_N^{k(n+N)}=W_N^{(k+N)n}.$$
## 二、按时间抽取（DIT）的FFT算法（库利-图基算法）
### 算法原理
方便讨论，设$N=2^\nu$，这种$N$为2的整数幂的FFT，也称基-2FFT。定义$$X(k)=\sum_{n=0}^{N-1}x(n)W_N^{nk}\qquad k=0,1,...,N-1$$分成奇偶子序列$$\begin{cases}x(2r)=x_1(r)\\x(2r+1)=x_2(r)\end{cases}\qquad r=0,1,...\frac N2-1$$记$X_1(k)$和$X_2(k)$分别是$x_1(r)$和$x_2(r)$的$N/2$点DFT$$X_1(k)=\sum_{r=0}^{N/2-1}x_1(r)W_{N/2}^{rk}=\sum_{r=0}^{N/2-1}x(2r)W_{N/2}^{rk}\\X_2(k)=\sum_{r=0}^{N/2-1}x_2(r)W_{N/2}^{rk}=\sum_{r=0}^{N/2-1}x(2r+1)W_{N/2}^{rk}$$$X(k)$表达为2部分：$$\begin{cases}X(k)=X_1(k)+W_N^kX_2(k)\\X(k+\frac N2)=X_1(k)-W_N^kX_2(k)\end{cases}\qquad k=0,1,...,\frac N2-1$$
以此二分法继续下分，可得到一个按级分解的“按时间抽取法”。
### 按时间抽取的FFT算法与直接计算DFT运算量的比较
总的运算次数：复数相乘$$m_F=\nu N/2=0.5N\log_2N,$$复数相加$$a_F=N\nu=N\log_2N.$$
直接算法对FFT算法的计算时间之比近似为$$\frac {N^2}{N\nu/2}=\frac{2N}\nu=\frac{2N}{\log_2N}.$$
### 按时间抽取的FFT算法的特点
DIT算法的输入是反序，输出是正序的。
### 按时间抽取的FFT算法的若干变体
## 三、按频率抽取（DIF）的FFT算法（桑德-图基算法）
### 算法原理
设$N=2^\nu$，令$$\begin{cases}x_1(n)=x(n)+x(n+\frac N2)\\x_2(n)=[x(n)-x(n+\frac N2)]\end{cases}\qquad n=0,1,...,\frac N2-1$$将$N$点DFT按频率$k$的奇偶分解成两个新序列的$N/2$点DFT$$\begin{cases}X(2r)=\sum_{n=0}^{N/2-1}x_1(n)W_{N/2}^{nr}\\X(2r+1)=\sum_{n=0}^{N/2-1}x_2(n)W_{N/2}^{nr}\end{cases}\qquad r=0,1,...,\frac N2-1$$以此类推，得到降级分解“按频率抽取法”。
### 时间抽取算法与频率抽取算法的比较
DIT与DIF存在两点差别：
1) DIF的输入正好是自然顺序，输出是范旭顺序，DIT正好相反。
2) DIF的蝶形运算与DIT略有不同，差别在于DIF复数乘法出现于减法之后。

二者相似之处：
1) 计算量相同，都需要$m_F=0.5N\log_2N$次复乘和$a_F=N\log_2N$次复加；
2) 二者均可原位运算。

二者互为转置。
### 离散傅里叶逆变换的快速算法(IFFT)
以$W_N^{-1}$代替$W_N$，并将结果乘以$1/N$，上述的FFT算法皆可直接用来运算IDFT。
### 按频率抽取的FFT算法的若干变体
## 四、N为复合数的FFT算法——统一的FFT方法
若列长$N\neq 2^\nu$，则有两个快速傅里叶变换的方法。
1. 补零使$N$增长到最近邻的$2^\nu$。这在许多场合是无害的，但不是最节省的计算方法。
2. 若要求准确的$N$点DFT值。若$N$是素数，则只能采用DFT或CZT算法；若$N$是合数，可分解成一些因子的乘积，则可用FFT的统一算法。前面讨论的FFT算法只是FFT的统一算法特例。
### 算法原理
$N$点DFT：$$X(k)=\sum_{n=0}^{N-1}x(n)W_N^{nk}\qquad k=0,1,...,N-1$$复合数$N=ML$中有表达式：$$n=Mn_1+n_0\qquad n_1=0,1,...,L-1\quad n_0=0,1,...,M-1$$
$$X(k)=\sum_{n_0=0}^{M-1}\{X_1(k_0,n_0)W_N^{n_0k_0}\}W_N^{n_0k_1}$$$$\qquad\qquad\quad=\sum_{n_0}^{M-1}X_1'(k_0,n_0)W_M^{n_0k_1}=X_2(k_0,k_1)$$其中$$X_1(k_0,n_0)=\sum_{n_1=0}^{L-1}x(n_1,n_0)W_L^{n_1k_0}\qquad k_0=1,2,...,L-1$$$W_2(k_0,k_1)$称为旋转因子，或铰链因子。$$X_2(k_0,k_1)=\sum_{n_0=0}^{M-1}X_1'(k_0,n_0)W_M^{k_1n_0}\qquad k_1=0,1,...,M-1$$
### 运算步骤
$N=ML$的运算步骤：
1. 改写$x(n)$：$x(n)=x(Mn_1+n_0)=x(n_1,n_2).$再对N点做DFT分解。
2. 先对列作$M$个$L$点的DFT：$$X_1(k_0,n_0)=\sum_{n_1=0}^{L-1}x(n_1,n_0)W_L^{k_0n_1}.$$
3. 把$N$个$X_1(k_0,n_0)$乘以响应的旋转因子$W_N^{k_0n_0}$组成一个新的序列$X_1'(k_0,n_0)$。
4. 再对行作$L$个$M$点的DFT$$X_2(k_0,k_1)=\sum_{n_0=0}^{M-1}X_1'(k_0,n_0)W_M^{k_1n_0}\qquad k_1=0,1,...,M-1$$
5. 进行译序

计算顺序：$$X(Lk_1+k_0)=\sum_{n_1=0}^{L-1}W_L^{k_0n_1}\sum_{n_0=0}^{M-1}\{[x(Mn_1+n_0)]W_N^{k_0n_0}\}W_M^{k_1n_0}$$
1. 先把时间序列与旋转因子$W_N^{k_0n_0}$相乘。
2. 计算每一行的$M$点离散傅里叶变换。
3. 计算每一列的$L$点离散傅里叶变换。
### 基数
基-2算法、基-4算法、基-8算法、混合基算法。
### N为复合数的FFT运算量的估计
复合数的FFT的总运算量：
- 复数乘法$N(M+L+1)$
- 复数加法$N(M+L-2)$
## 五、分裂基FFT算法
### 快速算法的探求
大于8的基数没有多大实际意义。将基-2和基-4分解揉合在一起，提出一种分裂基FFT算法。
### 算法原理
设$N=Pq,P=N/4,q=4$。则$n$和$k$可表示为$$n=\frac N4n_1+n_0\qquad 0\leqslant n_1\leqslant3,0\leqslant n_0\leqslant\frac N4-1\\k=4k_1+k_0\qquad0\leqslant k_1\leqslant\frac N4-1,0\leqslant k_0\leqslant3$$$x(n)$的$N$点DFT变换$X(k)$可分解为$$\begin{cases}X(2k)=\sum_{n=0}^{N/2-1}[x(n)+x(n+N/2)]W_N^{2kn}&0\leqslant k\leqslant N/2-1\\X(4k+1)=\sum_{n=0}^{N/4-1}\{[(x(n)-x(n+N/2))-j(x(n+N/4)-x(n+3N/4))]W_N^n\}W_N^{4kn}&0\leqslant k\leqslant N/4-1\\X(4k+3)=\sum_{n=0}^{N/4-1}\{[(x(n)-x(n+N/2))+j(x(n+N/4)-x(n+3N/4))]W_N^n\}W_{3N}^{4kn}&0\leqslant k\leqslant N/4-1\end{cases}$$
### 分裂基FFT算法的运算量
第$j$级有$l_j$个$L$型蝶形，$j=1,2,...,M-1,M=\log_2N.$$$l_1=\frac N4,\\l_j=\frac N4-\frac{l_{j-1}}2,\qquad j=2,...,M-1$$全部复乘次数$$C_M=\frac13N\log_2N-\frac{2N}9+(-1)^M\frac29.$$
## 六、实序列的FFT算法
### 问题的提出
复数FFT计算实数列不经济。
### 一个N点FFT同时运算两个N点实序列
$$X_1(k)=\mathsf{DFT}[x_1(n)]\\X_2(k)=\mathsf{DFT}[x_2(n)]$$令$$x(n)=x_1(n)+jx_2(n),$$$$X(k)=X_1(k)+X_2(k).$$反过来表示：$$\begin{cases}X_1(k)=X_{ep}(k)=[X(k)+X^*(N-k)]/2\\X_2(k)=-jX_{op}(k)=-j[X(k)-X^*(N-k)]/2\end{cases}$$
### 一个N点FFT运算一个2N点的实序列
将$2N$点实数列$x(n)$人为分成偶数组$x_1(n)$和奇数组$x_2(n)$：$$\begin{cases}x_1(n)=x(2n)&n=0,1,...,N-1\\x_2(n)=x(2n+1)&n=0,1,...,N-1\end{cases}$$将$x_1(n),x_2(n)$组成一个复数列$$y(n)=x_1(n)+jx_2(n),\\Y(k)=X_1(k)+jX_2(k).$$进而得到二者的DFT结果：$$\begin{cases}X_1(k)=\mathsf{DFT}[x_1(n)]=\frac12[Y(k)+Y^*(N-k)]=\sum_{n=0}^{N-1}x(2n)W_{2n}^{2nk},\\X_2(k)=\mathsf{DFT}[x_2(n)]=-j\frac12[Y(k)-Y^*(N-k)]=\sum_{n=0}^{N-1}x(2n+1)W_{2n}^{2nk}.\end{cases}$$因此可得$$X(k)=X_1(k)+W_{2N}^kX_2(k)\qquad0\leqslant k\leqslant2N-1$$或$$\begin{cases}X(k)=X_1(k)+W_{2N}^kX_2(k)\\X(k+N)=X_1(k)+W_{2N}^kX_2(k)\end{cases}\qquad0\leqslant k\leqslant N-1$$新算法需要的计算量：

复乘数  $m_{2F}=N(4+\log_2N)/2$
复加数  $a_{2F}=N(4+\log_2N)$
## 七、线性调频z变换(Chirp Z Transform)算法
### 问题的提出
### 算法原理
z变换$$X(z)=\sum_{n=0}^{N-1}x(n)z^{-n}$$$z$的取样点$z_k$为$$z_k=AW^{-k},k=0,1,...,M-1$$其中$A$$W$都是任意复数，即$$\begin{cases}A=A_0e^{j\theta_0}\\W=W_0e^{-j\Phi_0}\end{cases}$$因此有$$z_k=A_0W_0^{-k}e^{j(\theta_0+k\Phi_0)}.$$$$X(z_k)=\sum_{n=0}^{N-1}x(n)A^{-n}W^{nk}\qquad0\leqslant k\leqslant M-1$$令$$\begin{cases}f(n)=x(n)A^{-n}\cdot W^{n^2/2}\\h(n)=W^{n^2/2}\end{cases}\qquad n=0,1,...,N-1$$则有$$X(z_k)=W^{k^2/2}\sum_{n=0}^{N-1}f(n)h(k-n)\qquad k=0,1,...,M-1$$
### CZT的实现步骤
### CZT运算量的估算
### CZT算法的特点
## 八、ZFFT算法
