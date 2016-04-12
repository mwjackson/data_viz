class BoxPlot


{
  float minVal;
  float maxVal;
  float lowerQ=0.00;
  float upperQ=0.00;
  float median=0.00;
  float lowerQNo=0.00;
  float upperQNo=0.00;
  float medianNo=0.00;
  FloatList list;
  int x = 0;
  int y = 0;
  int len =0;
  float total = 0.00;
  Table t;
  int endX = 0;
  BoxPlot(int Posx, int Posy, int lenx, Table data, String boxName)
  {
    x = Posx;
    y = Posy;
    len = lenx;
    t = data;
    endX = Posx+lenx;
    line(x, y, x+len, y);
    boxes(boxName);
  }

  void boxes(String boxName)
  {

    list = new FloatList();

    for (int row=0;row<t.getRowCount();row++)
    { 
      if (boxName.equals("turnover")) {
        Float value = t.getFloat(row, "Current Turnover");

        if (value < minVal) {
          minVal = value;
        }
        if (value > maxVal) {
          maxVal = value;
        }
        list.append(value);
        total += value;
      }
      else if (boxName.equals("profit")) {
        Float value = t.getFloat(row, "Current Profit");
        if (value < minVal) {
          minVal = value;
        }
        if (value > maxVal) {
          maxVal = value;
        }
        list.append(value);
        total += value;
      }
    }
    list.sort();


    lowerQNo=(t.getRowCount()+1)/4.0;
    upperQNo=3*(t.getRowCount()+1)/4.0;
    medianNo=(t.getRowCount()+1)/2.0;
    int lower1 = 0;
    int lower2 =0;
    int med1 = 0;
    int med2 =0;
    int upper1 = 0;
    int upper2 =0;

    if ((floor(lowerQNo) != ceil(lowerQNo)) && ((lowerQNo/0.5)%2 == 1))
    {
      lower1 = floor(lowerQNo);
      lower2 = ceil(lowerQNo);
      lowerQ = ((list.get(lower1-1))+(list.get(lower2-1)))/2;
    }
    else 
    {
      lowerQNo = round(lowerQNo);
      lowerQ = list.get(int(lowerQNo)-1);
    }

    if (floor(medianNo) != ceil(medianNo))
    {
      med1 = floor(medianNo);
      med2 = ceil(medianNo);
      median = ((list.get(med1-1))+(list.get(med2-1)))/2;
    }
    else 
    {
      medianNo = medianNo;
      median = list.get(med1-1);
    }

    if ((floor(upperQNo) != ceil(upperQNo)) && ((upperQNo/0.5)%2 == 1))
    {
      upper1 = floor(upperQNo);
      upper2 = ceil(upperQNo);
      upperQ = ((list.get(upper1-1))+(list.get(upper2-1)))/2;
    }
    else 
    {
      upperQNo = round(upperQNo);
      upperQ = list.get(int(upperQNo)-1);
    }
    //    text(minVal, 1000, 520);
    //    text(lowerQ, 1000, 540);
    //    text(median, 1000, 560);
    //    text(upperQ, 1000, 580);
    //    text(maxVal, 1000, 600);


    float mapMin = map(minVal, minVal, maxVal, x, endX);
    float mapMax = map(maxVal, minVal, maxVal, x, endX);
    float mapMed = map(median, minVal, maxVal, x, endX);
    float mapLQ = map(lowerQ, minVal, maxVal, x, endX);
    float mapUQ = map(upperQ, minVal, maxVal, x, endX);

    //    text(mapMin, 1100, 520);
    //    text(mapLQ, 1100, 540);
    //    text(mapMed, 1100, 560);
    //    text(mapUQ, 1100, 580);
    //    text(mapMax, 1100, 600);

    //    ellipseMode(RADIUS);
    //    ellipse(mapMin, y-25, 2, 2);
    //    ellipse(mapLQ, y-25, 2, 2);
    //    ellipse(mapMed, y-25, 2, 2);
    //    ellipse(mapUQ, y-25, 2, 2);
    //    ellipse(mapMax, y-25, 2, 2);
    //    ellipseMode(CENTER);

    stroke(110);
    line(mapMin, y-45, mapMin, y-10);
    line(mapLQ, y-45, mapLQ, y-10);
    line(mapMed, y-45, mapMed, y-10);
    line(mapUQ, y-45, mapUQ, y-10);
    line(mapMax, y-45, mapMax, y-10);
    fill(255,0);
    rect(mapLQ,y-45,mapUQ-mapLQ,35);
fill(110);
    line(mapMin, y-27.5, mapLQ, y-27.5);
    line(mapMax, y-27.5, mapUQ, y-27.5);
    textFont(body,12);
    text(nf(minVal,1,1), x-25, y+3);
    text(nf(maxVal,1,1), x+len+2, y+3);
    }
  }

