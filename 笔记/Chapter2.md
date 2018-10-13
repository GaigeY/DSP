[toc]
# 第二章 离散时间信号和系统分析基础
## 一、连续时间信号的取样及取样定理
### 信号的取样
取样器输出一列重复周期为$T$，宽度为$\tau$的脉冲穿，幅度被原来的连续时间信号所调制。这样的信号叫**取样信号**。

$x_a(t)$代表连续时间信号，$p(t)$是周期取样脉冲，$\hat x(t)$表示取样信号：$$\hat x(t)=x_a(t)p(t)$$冲激函数序列$$p_\delta(t)=\sum_{n=-\infty}^\infty\delta(t-nT).$$理想冲激取样信号$$\hat x(t)=x_a(t)\sum_{n=-\infty}^\infty \delta(t-nT)=\sum_{n=-\infty}^\infty x_a(nT)\delta(t-nT).$$
### 取样定理
取样频率$f_s=1/T$，取样角频率$\Omega_s=2\pi/T$。

> 冲激函数序列$$p_\delta(t)=\sum_{n=-\infty}^\infty\delta(t-nT)=\frac1T\sum_{m=-\infty}^\infty e^{jm\frac{2\pi}Tt},$$
> 理想取样信号$\hat x(t)$的频谱为其傅里叶变换$$\hat X(j\Omega)=\int_{-\infty}^\infty\hat x(t)e^{-j\Omega t}dt=\int_{-\infty}^\infty x_a(t)p_\delta(t)e^{-j\Omega t}dt$$$$=\frac1T\sum_{n=-\infty}^\infty\int_{-\infty}^\infty x_a(t)e^{-j(\Omega-m\Omega_s)t}dt$$
> $x_a(t)$的傅里叶变换$$\hat X_a(j\Omega)=\int_{-\infty}^\infty x_a(t)e^{-j\Omega t}.$$
> $$\hat X(j\Omega)=\frac1T\sum_{n=-\infty}^\infty X_a[j(\Omega-m\Omega_s)]=\frac1T\sum_{n=-\infty}^\infty X_a\left[j\left(\Omega-m\frac{2m}T\right)\right]$$上式是$X_a(j\Omega)$的周期延拓。

##### 山农（Shannon）取样定理
信号最高频率$\Omega_h$和取样角频率$\Omega_s$的关系：$$\Omega_s\geqslant2\Omega_h.$$取样频率必须大于原信号最高频率两倍。

一般可取$$\Omega_s=(2.5\sim3)\Omega_h.$$

非零脉宽取样的频谱，幅度按包络$(\sin m\pi\tau/T)/(m\pi\tau/T)$的规律下降。
### 折叠频率与奈奎斯特（Nyquist）频率
**折叠频率**$\Omega_0$$$\Omega_0=\frac{\Omega_s}2;\qquad f_0=\frac{f_s}2=\frac1{2T}.$$折叠频率指系统能通过信号频谱分量中的最高频率。

信号中最高频率$\Omega_h$称为**奈奎斯特频率**，理论上能再恢复出原信号的最小取样率$\Omega_s=2\Omega_h$，称为奈奎斯特取样率。
### 信号的恢复
理想低通滤波器$$H(j\Omega)=\begin{cases}T&&|\Omega|<\Omega_s/2\\0&&|\Omega|\geqslant\Omega_s/2\end{cases}$$$$Y(j\Omega)=\hat X(j\Omega)H(j\Omega)=X_a(j\Omega),$$原模拟信号$$y(t)=x_a(t).$$
### 取样内插公式
理想低通滤波器$H(j\Omega)$的脉冲响应$$h_a(t)=\frac{\sin(\pi t/T)}{\pi t/T}.$$$$y(t)=\int_{-\infty}^\infty\hat x(\tau)h_a(t-\tau)d\tau=\sum_{n=-\infty}^\infty x_a(nT)h_a(t-nT).$$推导可得**取样内插公式**：$$x_a(t)=\sum_{n=-\infty}^\infty x_a(nT)\frac{\sin[\pi(t-nT)/T]}{\pi(t-nT)/T}.$$$h_a(t-nT)$称为内插函数。
## 二、离散时间信号的表示及运算规则
### 序列的表示法
$$x=\{x(n)\}\qquad\quad-\infty<n<+\infty$$
### 序列的运算规则及符号表示
##### 序列的积
$$x\cdot y=x(n)y(n)=w(n).$$
##### 序列加减
$$x\pm y=x(n)\pm y(n)=w(n).$$
##### 序列标乘
$$A\cdot x=Ax(n)=y(n).$$
##### 序列延时
$$y(n)=x(n\pm n_0).$$
##### 分支运算
$$y_1(n)=x(n),\qquad y_2(n)=x(n).$$

了解、掌握五种序列运算的图示。
### 常用的典型序列
##### 单位取样序列
$$\delta(n)=\begin{cases}1&&n=0\\0&&n\neq0\end{cases}$$单位取样序列也称单位脉冲序列，或称时域离散冲激，简称冲激。
##### 单位阶跃序列
$$u(n)=\begin{cases}1&&n\geqslant0\\0&&n<0\end{cases}$$两类序列可相互表示：$$\delta(n)=u(n)-u(n-1),$$$$u(n)=\sum_{k=0}^\infty\delta(n-k).$$
##### 矩形序列
$$R_N(n)=\begin{cases}1&&0\leqslant n\leqslant N-1\\0&&n<0,n\geqslant N\end{cases}$$三者关系：$$R_N(n)=u(n)-u(n-N)=\sum_{k=0}^{N-1}\delta(n-k).$$
##### 正弦序列
$$x(n)=\sin n\omega_0$$$\omega_0$是数字域频率，$\omega_0=\Omega_0T=\Omega_0/f.$

对连续时间信号取样：$$x_a(t)=\sin\Omega_0t,$$取样值为$$x(n)=x_a(nT)=\sin n\Omega_0T.$$
##### 实指数序列
$$x(n)=\begin{cases}a^n&&n\geqslant0\\0&&n<0\end{cases}$$
##### 复指数序列
$$x(n)=e^{(\sigma+j\omega_0)n},$$$$x(n)=e^{\sigma n}\cos(\omega_0n)+je^{\sigma n}\sin(\omega_0n).$$
### 序列的周期性
$x(n)=x(n+N)$成立，则称$x(n)$是周期序列，周期为$N$。

讨论正弦序列$\sin(\omega_0n)$，只有$2\pi/\omega_0$为有理数时，正弦序列是周期性的。
### 用加权延时单位取样序列的线性组合表示任意序列
$$x(n)=\sum_{k=-\infty}^\infty x(k)\delta(n-k).$$
### 序列的能量
$$\epsilon=\sum_{k=-\infty}^\infty|x(n)|^2.$$
## 三、离散时间线性非时变系统与差分方程
### 离散时间线性非时变系统及卷积运算
##### 离散时间系统
将输入序列变换为输出序列的算法或设备称为**离散时间系统**。$$y(n)=T[x(n)].$$
##### 线性系统
$$y_1(n)=T[x_1(n)],$$$$y_2(n)=T[x_2(n)].$$$$T[ax_1(n)+bx_2(n)]=y_1(n)+y_2(n).$$
##### 非时变系统
$$T[x(n)]=y(n),$$$$T[x(n-k)]=y(n-k).$$序列$x(n)$先位移后变换和先变换后位移是等效的。

非时变系统又称非移变系统。
##### 单位取样响应与卷积
单位取样响应序列是输入为单位取样序列$\delta(n)$的输出响应序列，设为$h(n)$：$$h(n)=T[\delta(n)],$$$$h_k(n)=T[\delta(n-k)].$$系统的输出$$y(n)=\sum_{k=-\infty}^\infty x(k)h(n-k)$$上式称作离散卷积，记为$$y(n)=x(n)* h(n)$$，也称线性卷积、直接卷积或卷积。
### 卷积运算的基本规律
##### 卷积的交换律
$$y(n)=x(n)*h(n)=h(n)* x(n).$$
##### 卷积的结合律
$$y(n)=[x(n)*h_1(n)]*h_2(n)$$$$\qquad=[x(n)*h_2(n)]*h_1(n)$$$$\qquad=x(n)*[h_1(n)* h_2(n)]$$
##### 卷积的分配律
$$y(n)=x(n)*[h_1(n)+h_2(n)]=x(n)*h_1(n)+x(n)* h_2(n)$$
### 系统的稳定性和因果性
##### 稳定系统
输出信号有界，输出信号也必定有界的系统称为**稳定系统**。$$s=\sum_{n=-\infty}^\infty|h(k)|<\infty.$$
##### 因果系统
输出序列在加入输入后才出现的系统，称为因果系统或物理可实现系统。$$h(n)=0\qquad n<0$$
##### 因果序列
$n<0$时，$x(n)=0$的序列称为因果序列。
##### 稳定的因果系统
$$s=\sum_{n=-\infty}^\infty|h(n)|<\infty\qquad h(n)=0\qquad n<0$$单位取样响应单边有界。
### 常系数线性差分方程
##### 差分
一阶向后差分$$\bigtriangledown^1y(n)=y(n)-y(n-1)$$一阶向前差分$$\bigtriangleup^1y(n)=y(n+1)-y(n)$$K阶差分$$\bigtriangledown^Ky(n)=\bigtriangledown(\bigtriangledown^{K-1}y(n))=\sum_{k=0}^K(-1)^kC_{K}^ky(n-k).$$
##### 差分方程
各阶差分组成的方程式称为差分方程。
##### 差分方程的阶
差分方程中输出响应最高和最低序号之差。
##### 常系数差分方程
各个$y(n-k)$型项都是一阶且不相乘，系数不含$n$。
## 四、离散时间信号和系统的频域分析
### 系统的频率相应

### 系统频率相应的两个性质
### 系统频率相应与单位取样响应的关系
### 序列的频域表示法
### 输出序列与输入序列的傅氏变换间的关系
## 五、傅里叶变换的对称性质
### 几个术语
### 傅里叶变换的对称性质
## 六、z变换
### z变换的定义
### z变换的收敛域
## 七、拉氏变换、傅氏变换及z变换间关系
### 序列的z变换与Laplaca变换间关系
### 序列的z变换与Fourier变换间关系
### 序列的傅氏变换与拉氏变换（双边）的关系
## 八、逆z变换
### 逆z变换公式
### 逆z变换的三种常用方法
## 九、z变换的定理与性质
### 线性特性
### 序列的移位
### 乘指数序列
### $X(z)$的微分
### 附属序列的共轭
### 初值定理
### 终值定理
### 序列的卷积
### 序列乘积的z变换——复卷积定理
### 帕斯维尔（Parseval）定理
## 十、单边z变换及双、单边z变换的应用场景
### 单边z变换的定义
### 单边逆z变换
### 双、单边z变换的应用场合
## 十一、系统函数
### 系统函数的定义
### 系统函数和差分方程的关系
### 系统函数的收敛域
### 系统频率响应的几何确定法
### 无限长单位脉冲响应（IIR）系统与有限长单位脉冲响应（FIR）系统
