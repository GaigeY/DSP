[toc]
# 第三章 离散傅里叶变换（DFT）
## 傅里叶变换的几种形式
傅里叶变换是在以时间为信号的“信号”与频率为自变量的“频谱”函数之间的某种关系。
#### 非周期连续时间信号的傅里叶变换
非周期连续时间信号$x_a(t)$的傅里叶变换$X_a(j\Omega)$：$$X_a(j\Omega)=\int_{-\infty}^\infty x_a(t)e^{-j\Omega t}dt,$$逆变换$$x_a(t)=\frac1{2\pi}\int_{-\infty}^\infty X_a(j\Omega)e^{j\Omega t}d\Omega.$$
#### 周期连续时间信号的傅里叶变换
周期为$t_p$的周期性连续时间信号$x_a(t)$的傅里叶变换是离散频率函数$$X(m\Omega)=\frac1{t_p}\int_{-\frac{t_p}2}^\frac{t_p}2x_a(t)e^{-jm\Omega t}dt,$$逆变换$$x_a(t)=\sum_{m=-\infty}^\infty X(m\Omega)e^{jm\Omega}$$角频率增量与周期$t_p$之间的关系$$\Omega=2\pi\frac1{t_p}=2\pi F\qquad F=\frac1{2\pi}$$一周期性的连续时间函数对应于一非周期性离散频率变换函数。
#### 非周期离散时间信号的傅里叶变换
变换对为$$X(e^{j\omega})=\sum_{-\infty}^\infty x(n)e^{-j\omega n}$$$$x(n)=\frac1{2\pi}\int_{-\pi}^\pi X(e^{j\omega})e^{j\omega}d\omega$$用数字域频率$\omega$表示变换对。

取样频率$f_s=1/T$，取样角频率$\Omega_s=2\pi/T$，取样数字频率$\Omega_s=2\pi$。

时域的取样对应于频域函数的周期延拓，是与函数的非周期对应于频域函数的连续。
#### 周期离散时间信号的傅里叶变换
实际上是周期的离散时间信号与周期的离散频率信号的变换对。

这是我们将要分析的**离散傅里叶级数变换**。

结论：取样和周期相互对应，周期等于取样增量的倒数。
## 离散傅里叶级数（DFS）
这是过渡内容。
#### 离散傅里叶级数变换的推导
只有DFT对于数字信号处理有实用价值。由于取样结果，前三种形式都能变为第四种。

为了更清楚地表示第三种傅里叶变换的周期性，在符号上加以周期性标识“$\sim$”：$$\widetilde X(e^{j\omega})=\sum_{n=-\infty}^\infty x(n)e^{-j\omega n}\rightarrow\sum_{n=0}^{N-1}x(n)e^{i\omega n}.$$离散周期序列的傅里叶级数变换对$$\widetilde X(k)=DFS[\widetilde x(n)]=\sum_{n=0}^{N-1}\widetilde x(n)e^{-j\frac{2\pi}Nkn}$$$$\widetilde x(n)=IDFS[\widetilde X(k)]=\frac1N\sum_{k=0}^{N-1}\widetilde X(k)e^{j\frac{2\pi}Nnk}$$其中$DFS[\cdot]$表示傅里叶级数正变换，$IDFS[\cdot]$表示傅里叶级数逆变换。令$$W_N=e^{-j\frac{2\pi}N},$$并称之为$W_N$因子，变换对变为$$\widetilde X(k)=DFS[\widetilde x(n)]=\sum_{n=0}^{N-1}\widetilde x(n)W_N^{kn}$$$$\widetilde x(n)=IDFS[\widetilde X(k)]=\frac1N\sum_{k=0}^{N-1}\widetilde X(k)W_N^{nk}$$
#### 离散傅里叶级数的主要性质
##### 线性特性
周期皆等于N的离散周期序列$\widetilde x_1(n),\widetilde x_2(n)$：$$\widetilde x_3(n)=a\widetilde x_1(n)+b\widetilde x_2(n),$$$$\widetilde X_3(k)=a\widetilde X_1(k)+b\widetilde X_2(k).$$
##### 序列位移
1. 时域移位$$DFS[\widetilde x(n+m)]=W_N^{-mk}\widetilde X(k).$$大于周期的移位和短于周期的移位在时域上不能区分。
2. 频域移位$$IDFS[\widetilde X(k+l)]=W_N^{nl}\widetilde x(n).$$
##### 周期卷积特性
1. 时域卷积$$\widetilde X_3(k)=\widetilde X_1(k)\cdot\widetilde X_2(k),$$$$\widetilde x_3(n)=\sum_{m=0}^{N-1}\widetilde x_1(m)\widetilde x_2(n-m)=\sum_{m=0}^{N-1}\widetilde x_2(m)\widetilde x_1(n-m).$$卷积过程仅限于一个周期以内，故称**圆周卷积**。
2. 频域卷积$$\widetilde x_3(n)=\widetilde x_1(n)\widetilde x_2(n),$$$$\widetilde X_3(k)=\frac1N\sum_{l=0}^{N-1}\widetilde X_1(l)\widetilde X_2(k-l)=\frac1N\sum_{l=0}^{N-1}\widetilde X_2(l)\widetilde X_1(k-l).$$
## 离散傅里叶变换的定义
##### DFT只有N个独立的复值
离散傅里叶变换(DFT)$$X(k)=DFT[x(n)]=\sum_{n=0}^{N-1}x(n)W_N^{kn}\qquad0\leqslant k\leqslant N-1$$离散傅里叶逆变换(IDFT)$$x(n)=IDFT[X(k)]=\frac1N\sum_{k=0}^{N-1}X(k)W_N^{-kn}\qquad0\leqslant n\leqslant N-1$$
##### DFT隐含周期性
##### 周期序列与有限长序列的本质联系
##### DFT是连续傅里叶变换的近似且便于计算机计算
## 离散傅里叶变换的性质
#### 线性特性
$$x_3(n)=ax_1(n)+bx_2(n)$$$$X_3(k)=aX_1(k)+bX_2(k)$$注意！$N_3=\max[N_1,N_2].$
#### 离散傅里叶逆变换的另一公式
$$x(n)=\frac1N\left[\sum_{k=0}^{N-1}X^*(k)W_N^{-nk}\right]^*\qquad0\leqslant n\leqslant N-1$$
#### 对称定理
$$x(n)\rightarrow X(k),\qquad\frac1NX(n)\rightarrow x(k).$$
#### 反转定理
$$x(n)\rightarrow X(k),\qquad x(-n)\rightarrow X(-k).$$
#### 序列的总和
$$X(k)|_{k=0}=\sum_{n=0}^{N-1}x(n)W_N^{nk}|_{k=0}=\sum_{n=0}^{N-1}x(n).$$
#### 序列的始值
$$x(0)=\frac1N\sum_{k=0}^{N-1}X(k).$$
#### 延长序列的离散傅里叶变换
把序列$x(n),0\leqslant N-1$人为填充零值至$rN$，得到$$g(n)=\begin{cases}
  x(n)&0\leqslant n\leqslant N-1\\
  0&N\leqslant n\leqslant rN-1
\end{cases}$$$g(n)$的离散傅里叶变换为$$G(k)=X(\frac kr).$$使得频谱更加细致。
#### 序列的圆周位移
##### 圆周移位
将$x(n)$以N为周期作周期延拓$$\widetilde x(n)=x((n))_N$$序列$x(n)$的圆周移位$$x_1(n)=x((n+m))_NR_ N(n)$$因此得名圆周移位、循环移位。
##### 有限长序列圆周移位定理
1. 时间移位定理$$\widetilde x_1(n)=\widetilde x(n+m),$$$$\widetilde X_1(k)=W_N^{-km}\widetilde X(k).$$
2. 频率移位定理（调制定理）$$IDFT[X((k+l))_NR_ N(k)]=W_N^{nl}x(n).$$
#### 圆周卷积（循环卷积）及其与有限长序列的线性卷积关系
##### 圆周卷积定理
$$X_3(k)=X_1(k)X_2(k),$$$$x_3(n)=\sum_{m=0}^{N-1}x_1(m)x_2((n-m))_NR_ N(n)=x_1(n)\circledast x_2(n).$$
##### 圆周卷积和线性卷积的关系
#### 圆周相关（圆周相关）定理
#### 帕斯维尔定理
#### 离散傅里叶变换的奇偶性及对称性
#### 离散傅里叶变换可看作一组滤波器
#### DFT与z变换
## 频域取样
#### 对$X(z)$取样是取样点数的限制
#### $X(z)$的内插公式
## 用DFT对连续时间信号逼近问题
#### 计算的变换与所需变换间相对数值的确定
#### 计算的变换与所需变换间的误差
## 加权技术与窗函数
#### 加权的作用
#### 常用的窗函数
