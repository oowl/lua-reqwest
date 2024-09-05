package.cpath = package.cpath .. ";./target/release/?.so;./target/debug/?.so"
require 'busted.runner'({ standalone = false })