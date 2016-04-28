// container for our data
// allows us to more easily pass around subsets of the data from our all_occ table
public class GenderData {
  public final float male;
  public final float female;
  public final String age;

  public GenderData(String age, float male, float female) {
    this.age = age;
    this.male = Float.isNaN(male) ? 0 : male;  // set missing data to 0 for drawing
    this.female =  Float.isNaN(female) ? 0 : female;
  }
  
  public String toString() {
    return this.age + " M: " + this.male + " F: " + this.female;
  }
}

List<GenderData> loadData(String filterMainBy, String filterOccupationBy) {
  List<GenderData> data = new LinkedList<GenderData>();

  // loop through all_occ table and add any matching rows to our list
  for (TableRow row : all_occ.rows()) {
    // if we have no filter, or it equals the row then return it
    if (filterOccupationBy.equals("") || row.getString("Occupation").equals(filterOccupationBy)) {
      data.add(new GenderData(row.getString("Age"), row.getFloat("Male"), row.getFloat("Female")));
    }
  }

  return data;
}