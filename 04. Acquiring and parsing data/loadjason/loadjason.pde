// Load the JSON data which is an array of objects

void readJSON()
{
  // Create empty table in which to put data
  dsTable = new Table();
  dsTable.addColumn("winner");
  dsTable.addColumn("delegates");
  dsTable.addColumn("state");
  dsTable.addColumn("party");

JSONArray jArray = loadJSONArray("primaries.json");