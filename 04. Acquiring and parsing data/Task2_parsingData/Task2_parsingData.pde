// Reads and displays GDP data.
// Jo Wood, 12th February 2016
  
float[] years;    // Stores a collection of dates.
float[] gdps;     // Stores a collection of GDP values.
  
float minYear, maxYear;
float minGDP  = MAX_FLOAT;
float maxGDP  = MIN_FLOAT;
  
void setup()
{
  size(400, 200);
  readData();
  findMinMax();
}
  
void draw()
{
  background(255);
  
  beginShape();    // Start a line shape.
  for (int i=0; i<years.length; i++)
  {
    if (gdps[i] > 0)
    {
      // Plot each coordinate pair in the line.
      float x = map(years[i], minYear, maxYear, 0, width);
      float y = map(gdps[i], minGDP, maxGDP, height, 0);
      vertex(x, y);
    }
  }
  endShape();    // End the line shape.
    
  noLoop();      // Draw just once.
}
  
// Finds the minimum and maximum values in the data.
void findMinMax()
{
  for (float gdp : gdps)
  {   
    minGDP = min(minGDP, gdp);
    maxGDP = max(maxGDP, gdp);
  }
  // Years are in order, so min/max are first and last elements.
  minYear = years[0];
  maxYear = years[years.length-1];
}