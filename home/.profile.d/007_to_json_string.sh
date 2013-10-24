to_json_string(){
  sed s/$/\\\\n/ | tr -d '\n'
}