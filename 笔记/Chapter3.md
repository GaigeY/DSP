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
1. 时域卷积
## 离散傅里叶变换的定义
## 离散傅里叶变换的性质
#### 线性特性
#### 离散傅里叶逆变换的另一公式
#### 对称定理
#### 反转定理
#### 序列的总和
#### 序列的始值
#### 延长序列的离散傅里叶变换
#### 序列的圆周位移
#### 圆周卷积（循环卷积）及其与有限长序列的线性卷积关系
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
