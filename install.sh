#!/bin/bash

echo "Setting up Lacrosse Timer App environment..."

# start by making a virtual environment so we can get around needing admin priv
python -m venv lax_timer_env

# activate the virtual environment
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # for windows
    source lax_timer_env/Scripts/activate
else
    # for linux or mac
    source lax_timer_env/bin/activate
fi

# make sure we install any neeed packages
pip install python-docx
pip install tk

# check if tkinter is available
python -c "import tkinter" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Tkinter is not installed. Please install it for your system."
    echo "On Ubuntu/Debian: sudo apt-get install python3-tk"
    echo "On Fedora: sudo dnf install python3-tkinter"
    echo "On macOS: brew install python-tk"
    echo "On Windows: Tkinter should be included with Python installation."
fi

echo "Installation complete! Run the app with:"
echo "source lax_timer_env/bin/activate  # On Linux/Mac"
echo "source lax_timer_env/Scripts/activate  # On Windows"
echo "python LaxTimer.py"
