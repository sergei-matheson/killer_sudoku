require "crake/global"

entry_point = "exe/killer-sudoku.cr"
target = "build/killer-sudoku"

task "default # Default target (spec)", %w(spec)

task "run # Run executable", %w(build) do
  sh "crystal run #{entry_point}"
end

task "build # Build executable for release" do
  sh "mkdir -p build"
  sh "crystal build --release -o #{target} #{entry_point}"
end

file "build/killer-sudoku", [entry_point] do |i|
end

task "clean # Clean build directory" do
  sh "rm -rf build"
end

task "spec # Run all specs" do
  sh "crystal spec"
end

task "format # Run format tool" do
  sh "crystal tool format src spec"
end

task "install # Installs to user bin dir", %w(build) do
  sh "cp #{target} ~/bin/"
end
