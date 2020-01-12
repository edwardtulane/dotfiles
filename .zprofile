# export LD_LIBRARY_PATH='/usr/lib/openmpi:/usr/lib:/opt/OpenBLAS/lib'
# export TMPDIR='/scr'
# export MACH='gcc'
# export PYTHONPATH='/home/brausse/program'
export PATH=$PATH':/opt/ape/bin'
export PATH=$PATH':/home/brausse/sw/grasp/bin/:/home/brausse/sw/openmx3.8/source/'
export PATH=$PATH':/home/brausse/sw/openmx3.8/adpack2.2/source/'

# Dalton environment variables
export DALTON_TMPDIR='/tmp/dalton'

export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

export PYSPARK_PYTHON=python
export PYSPARK_DRIVER_PYTHON=ipython


# start pcman in daemon mode to enable automount
# pcmanfm-qt -d

# activate numlock on startup
# numlockx on

# export gtk-config
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

#export QT_QPA_PLATFORMTHEME="lxqt"

#ATLAS tweaks
# export MALLOC_TRIM_THRESHOLD_=-1
# export MALLOC_MMAP_MAX_=0
# 
# export OMPI_CC='/usr/bin/gcc-4.9'
# export OMPI_CXX='/usr/bin/g++-4.9'
# export OMPI_FC='/usr/bin/gfortran-4.9'


# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
