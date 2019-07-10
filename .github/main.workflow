workflow "run test" {
  on = "push"
  resolves = ["bin rails test"]
}

action "bin rails test" {
  uses = "ruby"
  args = "test"
}

action "run test" {
  needs "prepare sqlite3"

}
