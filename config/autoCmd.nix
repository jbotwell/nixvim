{
  autoCmd = [
    {
      event = ["BufEnter" "BufWinEnter"];
      pattern = ["*.c" "*.h"];
      command = "echo 'Entering a C or C++ file'";
    }
  ];
}
