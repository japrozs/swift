# Test if the Swift compiler supports -disable-implicit-<module>-module-import
function(swift_supports_implicit_module module_name out_var)
  file(WRITE "${CMAKE_BINARY_DIR}/tmp/empty-check-${module_name}.swift" "")
  execute_process(
    COMMAND
      "${CMAKE_Swift_COMPILER}"
      -Xfrontend -disable-implicit-${module_name}-module-import
      -c - -o /dev/null
    INPUT_FILE
      "${CMAKE_BINARY_DIR}/tmp/empty-check-${module_name}.swift"
    OUTPUT_QUIET ERROR_QUIET
    RESULT_VARIABLE
      result
  )
  if(NOT result)
    set("${out_var}" "TRUE" PARENT_SCOPE)
  else()
    set("${out_var}" "FALSE" PARENT_SCOPE)
  endif()
endfunction()
