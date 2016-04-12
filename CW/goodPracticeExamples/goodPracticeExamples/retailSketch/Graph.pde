class Graph
{
  int zerox, zeroy, x, y;
  int maxVal = 0;
  int saleVal = 0;
  int fuelVal = 0;
  int average = 0;
  float baverage = 0.00;
  IntList salesValList;
  IntList fuelValList;
  IntList averageList;
  StringList brandList;
  FloatList mappedSalesValList;
  FloatList mappedFuelValList;
  FloatList averageValList;
  FloatList salesValListFloat;
  float brandAverage = 0.00;
  Table t; 
  String dataName;
  float brandVal = 0.00;
  float maxbrandval = 0.00;
  int element;
  boolean isHover = false;
  Tooltip tt; 
   Tooltip2 tt2; 

  Graph (int zeroPosx, int zeroPosy, int lenx, int leny, Table table, String data) {
    zerox = zeroPosx;
    zeroy = zeroPosy;
    x = lenx;
    y = leny;
    t = table;
    stroke(0);

    stroke(255);
    strokeWeight(1);
    bars(data);
    stroke(255);

    createLine(data);
    strokeWeight(2);
    stroke(0);
    line(zerox, zeroy, zerox+x, zeroy); //x
    line(zerox, zeroy, zerox, zeroy-y); //y
  }

  void bars(String data) {
    dataName = data;
    salesValList = new IntList();
    fuelValList = new IntList();
    salesValListFloat = new FloatList();
    mappedSalesValList = new FloatList();
    mappedFuelValList = new FloatList();
brandList = new StringList();
    float barWidth = ((x)/t.getRowCount());

    if (dataName.equals("salesVal")) {
      for (int row=0;row<t.getRowCount();row++)
      {
        float barStart = zerox;
        saleVal = t.getInt(row, "Predominantly food stores") + retailSalesVal.getInt(row, "Predominantly non-food stores") + retailSalesVal.getInt(row, "Non-store retailing");
        fuelVal = t.getInt(row, "Automotive fuel");  
        if (saleVal > maxVal) {
          maxVal = saleVal;
        }
        fuelValList.append(fuelVal);
        salesValList.append(saleVal);
      }
      for (int i=0;i<salesValList.size();i++)
      {
        float temp = salesValList.get(i);
        float mapSalesVal = map(temp, 0, maxVal, zeroy, zeroy-y);
        mappedSalesValList.append(mapSalesVal);

        float temp1 = fuelValList.get(i);
        float mapFuelVal = map(temp1, 0, maxVal, zeroy, zeroy-y);
        mappedFuelValList.append(mapFuelVal);
      }
      for (int i=0;i<mappedSalesValList.size();i++)
      {
        int startPos = zerox;
        String yr = t.getString(i, "Date");
        stroke(255);
        fill(87, 128, 186);
        rect(zerox+(i*barWidth), mappedSalesValList.get(i), barWidth, zeroy-mappedSalesValList.get(i));
        fill(0, 158, 217);
        rect(zerox+(i*barWidth), mappedFuelValList.get(i), barWidth, zeroy-mappedFuelValList.get(i));
        if (mouseX > zerox+(i*barWidth) && mouseX < zerox+((i+1)*barWidth) ) {
          if (mouseY < mappedFuelValList.get(i) && mouseY > mappedSalesValList.get(i))
          {
            stroke(255);
            fill(133, 164, 205);
            rect(zerox+(i*barWidth), mappedSalesValList.get(i), barWidth, zeroy-mappedSalesValList.get(i)-(zeroy-mappedFuelValList.get(i)));
            int val = t.getInt(i, "Predominantly food stores") + retailSalesVal.getInt(i, "Predominantly non-food stores") + retailSalesVal.getInt(i, "Non-store retailing");
            tt = new Tooltip(120, 110,120,25, "h",nfc(val));
          }
          if (mouseY > mappedFuelValList.get(i) && mouseY < zeroy)
          {
            stroke(255);
            fill(97, 206, 248);
            rect(zerox+(i*barWidth), mappedFuelValList.get(i), barWidth, zeroy-mappedFuelValList.get(i));
            int val = t.getInt(i, "Automotive fuel"); ;
            tt = new Tooltip(120, 110,120,25, "h",nfc(val));
          }
        }
        
        fill(51);
        text(yr.substring(yr.length()-3, yr.length()), zerox+(i*barWidth+2), zeroy + 20);
      }
      fill(51);
      
      text(nfc(maxVal), 35, 135);
      text(nfc((3*maxVal)/4), 35, 225.5);
      text(nfc(maxVal/2), 35, 310);
      text(nfc(maxVal/4), 40, 483-87.5);
      text("0", zerox-10, 480+3);
    }



    else if (dataName.equals("histVal")) {
      for (int row=0;row<t.getRowCount();row++)
      {
        float barStart = zerox;
        saleVal = t.getInt(row, "Retail");
        fuelVal = t.getInt(row, "Fuel");  
        if (saleVal > maxVal) {
          maxVal = saleVal;
        }
        fuelValList.append(fuelVal);

        salesValList.append(saleVal);
      }
      for (int i=0;i<salesValList.size();i++)
      {
        float temp = salesValList.get(i);
        float mapSalesVal = map(temp, 0, maxVal, zeroy, zeroy-y);
        mappedSalesValList.append(mapSalesVal);

        float temp1 = fuelValList.get(i);
        float mapFuelVal = map(temp1, 0, maxVal, zeroy, zeroy-y);
        mappedFuelValList.append(mapFuelVal);
      }
      for (int i=0;i<mappedSalesValList.size();i++)
      {
        int startPos = zerox;
        String yr = t.getString(i, "Date");
        fill(87, 128, 186);
        rect(zerox+(i*barWidth), mappedSalesValList.get(i), barWidth, zeroy-mappedSalesValList.get(i));
        fill(0, 158, 217);
        rect(zerox+(i*barWidth), mappedFuelValList.get(i), barWidth, zeroy-mappedFuelValList.get(i));
        if (mouseX > zerox+(i*barWidth) && mouseX < zerox+((i+1)*barWidth) ) {
          if (mouseY < mappedFuelValList.get(i) && mouseY > mappedSalesValList.get(i))
          {
            stroke(255);
            fill(133, 164, 205);
            rect(zerox+(i*barWidth), mappedSalesValList.get(i), barWidth, zeroy-mappedSalesValList.get(i)-(zeroy-mappedFuelValList.get(i)));
            int val = t.getInt(i, "Retail");
            tt = new Tooltip(555, 110,130,25, "h",nfc(val));
          }
          if (mouseY > mappedFuelValList.get(i) && mouseY < zeroy)
          {
            stroke(255);
            fill(97, 206, 248);
            rect(zerox+(i*barWidth), mappedFuelValList.get(i), barWidth, zeroy-mappedFuelValList.get(i));
            int val = t.getInt(i, "Fuel"); ;
            tt = new Tooltip(555, 110,130,25, "h",nfc(val));
          }
        }
        fill(51);
        text(yr, zerox+(i*barWidth+6), zeroy + 20);
      }
      fill(51);
      text(nfc(maxVal), 465, 135);
      text(nfc((3*maxVal)/4), 465, 225.5);
      text(nfc(maxVal/2), 465, 310);
      text(nfc(maxVal/4), 470, 483-87.5);
      text("0", zerox-10, 480+3);
    }

    else if (dataName.equals("brandGraph")) {
      for (int row=0;row<t.getRowCount();row++)
      {
        float barStart = zerox;
        brandVal = t.getFloat(row, "Sales(m)");
        String brand = t.getString(row, "Brand");
        if (brandVal > maxbrandval) {
          maxbrandval = brandVal;
        }
        salesValListFloat.append(brandVal);
        brandList.append(brand);
      }
      for (int i=0;i<salesValListFloat.size();i++)
      {
        float temp = salesValListFloat.get(i);
        float mapSalesVal = map(temp, 0, maxbrandval, zeroy, zeroy-y);
        mappedSalesValList.append(mapSalesVal);
      }
      for (int i=0;i<mappedSalesValList.size();i++)
      {
        int startPos = zerox;
        fill(0, 158, 217);
        rect(zerox+(i*barWidth), mappedSalesValList.get(i), barWidth, zeroy-mappedSalesValList.get(i));
        if (mouseX > zerox+(i*barWidth) && mouseX < zerox+((i+1)*barWidth) ) {
          if (mouseY > mappedSalesValList.get(i) && mouseY < zeroy)
          {
            stroke(255);
            fill(133, 164, 205);
            rect(zerox+(i*barWidth), mappedSalesValList.get(i), barWidth, zeroy-mappedSalesValList.get(i));
            tt2 = new Tooltip2(720,120,140,50,"w",brandList.get(i),str(salesValListFloat.get(i))+"m");
          }}
      }
    }
  }


  void createLine(String data) {
    dataName = data;
    averageList = new IntList();
    averageValList = new FloatList();
    ;

    float barWidth = ((x)/t.getRowCount());

    if (dataName.equals("salesVal")) {
      for (int row=0;row<t.getRowCount();row++)
      {
        float barStart = zerox;
        average = t.getInt(row, "Average");  
        if (average > maxVal) {
          maxVal = average;
        }
        averageList.append(average);
      }
      for (int i=0;i<averageList.size();i++)
      {
        float temp = averageList.get(i);
        float mapSalesVal = map(temp, 0, maxVal, zeroy, zeroy-y);
        averageValList.append(mapSalesVal);
      }
      for (int i=0;i<mappedSalesValList.size();i++)
      {
        int startPos = zerox;
        fill(0, 74, 219);
        ellipse(zerox+(i*barWidth)+(barWidth/2), averageValList.get(i), 5, 5);
      }
    }
    else if (dataName.equals("histVal")) {
      for (int row=0;row<t.getRowCount();row++)
      {
        float barStart = zerox;
        average = t.getInt(row, "Average");  
        if (average > maxVal) {
          maxVal = average;
        }
        averageList.append(average);
      }
      for (int i=0;i<averageList.size();i++)
      {
        float temp = averageList.get(i);
        float mapSalesVal = map(temp, 0, maxVal, zeroy, zeroy-y);
        averageValList.append(mapSalesVal);
      }
      for (int i=0;i<mappedSalesValList.size();i++)
      {
        int startPos = zerox;
        fill(0, 74, 219);
        ellipse(zerox+(i*barWidth)+(barWidth/2), averageValList.get(i), 5, 5);
      }
    }


    else if (dataName.equals("brandGraph")) {
      for (int row=0;row<t.getRowCount();row++)
      {
        float barStart = zerox;
        baverage = t.getFloat(row, "Sales(m)");
        if (baverage > maxbrandval) {
          maxbrandval = baverage;
        }
        brandAverage = brandAverage + baverage;
      }
      float avg = brandAverage/t.getRowCount();
      float mapSalesVal = map(avg, 0, maxbrandval, zeroy, zeroy-y);
      text(mapSalesVal, 800, 680);
      stroke(2);
      line(zerox, mapSalesVal, zerox+x, mapSalesVal);
      text("Average Sales = "+ nf(avg,1,1) +"m",740,mapSalesVal-2);
      fill(51);
       text("1192.0",335,130);
        text("0",zerox-15,zeroy+5);
    }
  }
}

