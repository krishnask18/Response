import matplotlib.pyplot as plt
from matplotlib.widgets import Button
import numpy as np
import mplcursors as mpc

n = np.linspace(0, 4*np.pi, 1000)
xn = np.sin(n)
bgax = plt.axes([0, 0, 1, 1])
ax = plt.axes([0, 0, 0.7, 1])
bgax.set_facecolor(color='#05141b')
ax.set_facecolor(color='#05141b')
b_ax1 = plt.axes([0.98, 0.97, 0.02, 0.03])
bttn1 = Button(b_ax1, label = 'X', color='0.50', hovercolor='0.80')
bttn1.on_clicked(exit)
manager = plt.get_current_fig_manager()
manager.full_screen_toggle()
ax.plot(xn, '#ffa000')
mpc.cursor(hover=True)
plt.show()