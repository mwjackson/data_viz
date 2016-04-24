import java.util.*;

public class GenderData {
  public final float male;
  public final float female;
  public final String age;

  public GenderData(String age, float male, float female) {
    this.age = age;
    this.male = Float.isNaN(male) ? 0 : male;
    this.female =  Float.isNaN(female) ? 0 : female;
  }
  
  public String toString() {
    return this.age + " M: " + this.male + " F: " + this.female;
  }
}

List<GenderData> loadData(String file, String filterOccupationBy) {
  List<GenderData> data = new LinkedList<GenderData>();

  Table table = loadTable(file, "header,csv");

  for (TableRow row : table.rows()) {
    // if we have no filter, or it equals the row then return it
    if (filterOccupationBy.equals("") || row.getString("Occupation").equals(filterOccupationBy)) {
      data.add(new GenderData(row.getString("Age"), row.getFloat("Male"), row.getFloat("Female")));
    }
  }

  return data;
}

float maxMale(List<GenderData> data) {
  float max = MIN_FLOAT;
  
  for(GenderData d: data) {
    max = max(max, d.male);
  }
  
  return max;
}

float maxFemale(List<GenderData> data) {
  float max = MIN_FLOAT;
  
  for(GenderData d: data) {
    max = max(max, d.female);
  }
  
  return max;
}

float minMale(List<GenderData> data) {
  float min = MAX_FLOAT;
  
  for(GenderData d: data) {
    min = min(min, d.male);
  }
  
  return min;
}

float minFemale(List<GenderData> data) {
  float min = MAX_FLOAT;
  
  for(GenderData d: data) {
    min = min(min, d.female);
  }
  
  return min;
}