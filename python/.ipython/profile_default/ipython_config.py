c = get_config()

c.InteractiveShell.colors = "Linux"

try:
    from IPython.core.ultratb import VerboseTB
    VerboseTB.tb_highlight = "bg:#d93c3c"
except Exception:
    print("Error patching background color for tracebacks, they'll be the ugly default instead")
