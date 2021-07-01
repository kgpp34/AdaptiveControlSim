# AdaptiveControlSim

- how to use this simulation

  First of all, the software environments are as follows:

  - Operating System: Windows/MacOS
  - Simulation and Numerical Computation: Matlab2015b /2016b(At the same time, you must install the Simulink module)

  Then, run the MRAC_params.m

  At last, there will display two figures, which represent the state tracking error, and identification model switching signals.

- the application of the simulation

  This numerical simulation focus on the aero-engine control field. Actually, if the form of the controlled plant(object) satisfies:

  ​                                 dot x = A*x + B*u+d

  the simulation can also run ideally.
  
  Furthermore, in the dynamics formula, d is the constant item(affine vector). and the system matrix A and affine vector can also unknown.
  If your controlled plant does not contain the affine vector, you can set both d and the adaptive law of d_hat = 0.
  
  > 欢迎各位同学报考大连理工大学电子信息与电气工程学部
