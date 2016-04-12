//declare all the variables

PImage mapImage; //background map image
Table locationTable; //Table storing country locations
Table dataTable; //Table storing dental health data
float dataMin = MAX_FLOAT; //used to store min and max data values
float dataMax = MIN_FLOAT;

//start the sketch and load the data (image and 2 tables)
void setup()
{
  size(1000,550);
  
  //Load the background map.
  mapImage =loadImage("worldCountries.png");
  
  //Load data from tables
  locationTable = loadTable("countryLocations.csv","header,csv");
  dataTable = loadTable("badTeeth.csv","header,csv");
  
  //find the min and max values
  
  //This first line goes through the loop the number of times there are rows
  for (int row=0; row<dataTable.getRowCount(); row++) //row++ means add row +1  
  {
    dataMin = min(dataMin,dataTable.getFloat(row,"NumBadTeeth"));
    dataMax = max(dataMax, dataTable.getFloat(row,"NumBadTeeth"));
  }
println(dataMin); 
println(dataMax);
}  

// Plots the data over the background map.
void draw()
{
  background(255);//set background to white
  
  //draw the background image taking up full width and height of sketch with coordinates 0,0
  image(mapImage,0,0,width,height);
  
  //set the appearance of the data circles
  fill(192,0,0,80); //red with some transparency to deal with overlapping circles
  stroke(255); //colour of outline
  strokeWeight(0.5); //thickness of outline
  
   
  // Go through each row in table drawing each data item as a circle.
  for (int row=0; row<dataTable.getRowCount(); row++)
  {
    // Get the bad teeth data for the country.
    String countryName = dataTable.getString(row,"CountryName");
    float badTeeth     = dataTable.getFloat(row,"NumBadTeeth");
    //Re-maps a number from one range to another. map(a,b,c,d,e) a=value b,c=lower and upper bound of current value,
    //d,e= lower upper bound of target range
    float circleSize = map(badTeeth,dataMin,dataMax,1,30);
     
    // Find the row in the location table that matches the country in the data table.
    TableRow countryRow = locationTable.findRow(countryName,"CountryName");
     
    // It is possible that we cannot find countryName (from the dataTable) in the
    // location table, so only attempt to plot the circle if country is found in both.
    if (countryRow != null)
    {   
      // Extract the latitude and longitude from the row we have found.
      float latitude  = countryRow.getFloat("latitude");
      float longitude = countryRow.getFloat("longitude");
       
      // Scale the latitude and longitude to fit in the sketch.
      float x = map(longitude,-180,180,0,width);
      float y = map(latitude,-65,85,height,0);
      ellipse(x,y,circleSize,circleSize);
    }
  }
}