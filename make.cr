require "crake/global"

entry_point =  "exe/killer-sudoku.cr"

task "default # Default target (spec)", %w(spec)

task "run # Run executable", %w(build) do
  sh "crystal run #{entry_point}"
end

task "build # Build executable for release", %w(build/killer-sudoku)

file "build/killer-sudoku", [entry_point] do |i|
  sh "mkdir -p build"
  sh "crystal build --release -o #{i.target} #{i.deps[0]}"
end

task "clean # Clean build directory" do
  sh "rm -rf build"
end

task "spec # Run all specs" do
  sh "crystal spec"
end

