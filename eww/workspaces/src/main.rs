use swayipc::{Connection, EventType, Fallible};

fn get_ws_info(mut conn: Connection) -> Fallible<()> {
  let mut res = Vec::<String>::new();
  for ws in conn.get_workspaces()? {
    res.push(format!("[{},\"{}\",{}]", ws.num, ws.name, ws.focused));
  }
  println!("[{}]", res.join(","));
  Ok(())
}

fn main() -> Fallible<()> {
  let connection = Connection::new()?;
  for _ in connection.subscribe([EventType::Workspace])? {
    get_ws_info(Connection::new()?)?;
  }
  Ok(())
}
