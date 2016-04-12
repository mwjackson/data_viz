// Simple parallel plot using Anderson's Iris Data
// Jo Wood, 13th March, 2016.
 
Table irisTable;    // All the Iris data.
float maxValues[];  // Maximum sepal and petal length and width.
 
void setup()
{
  size(600,600);
   
  textAlign(CENTER,CENTER);
  textSize(18);
  readData();
}
 
void draw()
{
  background(255);
   
  // The x-position of the two parallel axes.
  float x1 = width*.25;
  float x2 = width*.75;
    
  // Plot the data items.
  for (int row=0; row<irisTable.getRowCount(); row++)
  {
    float sLength = irisTable.getFloat(row,"SepalLength");
    float pLength = irisTable.getFloat(row,"PetalLength");
     
    // Scale to screen coordinates.
    float y1 = map(sLength,0,maxValues[0],height-10,10);  // Sepal length
    float y2 = map(pLength,0,maxValues[2],height-10,10);  // Petal length
     
    // Draw lines.
    stroke(irisTable.getInt(row,"colour"));
    line(x1,y1,x2,y2);
  }
   
   // Plot the parallel axes.
  stroke(50);
  line(x1,10,x1,height-10);
  line(x2,10,x2,height-10);
   
  fill(120);
  float textHeight = textAscent()+textDescent();
  verticalText("Sepal length",x1-textHeight,height/2);
  verticalText("Petal length",x2+textHeight,height/2);
   
  noLoop();      // Draw once only.
}