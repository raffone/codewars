spiralize = (size) ->
  currDir = 1
  currPos = [1 1]

  mov =
    * -1  0
    *  0  1
    *  1  0
    *  0 -1

  look =
    * -2 0 0  0
    *  0 2 0  0
    *  0 0 2  0
    *  0 0 0 -2


  matrix = [[0] * (size + 2)] * (size + 2)

  activateCurrentCell = !->
    matrix[currPos.0][currPos.1] = 1

  nextPosition = !->
    currPos{0 1} += mov[currDir]

  nextDirection = !->
    currDir := 0 if ++currDir is 4


  lookAhead = ->
    matrix[currPos.0 + look[currDir]0][currPos.1] is 0 and
    matrix[currPos.0 + look[currDir]2][currPos.1] is 0 and
    matrix[currPos.0][currPos.1 + look[currDir]1] is 0 and
    matrix[currPos.0][currPos.1 + look[currDir]3] is 0

  loop
    for i til size - 1

      if lookAhead!
        activateCurrentCell!
      else
        break

      nextPosition!
    nextDirection!

    if i <= 1
      activateCurrentCell!
      break

  matrix.pop!
  matrix.shift!

  for matrix
    ..pop!
    ..shift!

  matrix

console.log spiralize 5

# drawSpiral = (arr) ->
#   arr * \\n


# console.log drawSpiral createSpiral 8


# console.log showGrid []=
#   * 1 1 1 1 1
#   * 0 0 0 0 1
#   * 1 1 1 0 1
#   * 1 0 0 0 1
#   * 1 1 1 1 1
