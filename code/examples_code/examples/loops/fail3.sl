namespace: examples.loops

operation:
  name: fail3

  inputs:
    - text

  action:
    python_script: print text

  results:
    - FAILURE: ${int(text) == 3}
    - SUCCESS
