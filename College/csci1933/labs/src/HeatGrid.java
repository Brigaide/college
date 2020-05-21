import java.lang.Math;

public class HeatGrid {

    int array[][];

    public HeatGrid(int width, int height){
        array = new int[height][width];
        for (int i=0; i<width; i++){
            for (int j=0; j<height; j++) {
                array[j][i] = 0;

            }
        }
    }

    public boolean placeSource(String src, int x, int y){
        int heatVal=0;
        int range=0;
        double decay=0;
        if (src.equals("l")){
            heatVal = 1;
            range = 0;
            decay = 0;
        }
        if (src.equals("c")){
            heatVal = 4;
            range = 2;
            decay = 0.5;
        }
        if (src.equals("f")){
            heatVal = 10;
            range = 4;
            decay = 0.35;
        }
        if (src.equals("i")){
            heatVal = -2;
            range = 1;
            decay = 0.5;
        }
        if (src.equals("r")){
            heatVal = -8;
            range = 3;
            decay = 0.2;
        }
        if (src.equals("g")){
            heatVal = -20;
            range = 5;
            decay = 0.15;
        }

        if (x>=array[0].length || x<0){
            return false;
        }
        if (y>=array.length || y<0){
            return false;
        }
        for(int i=0; i<array.length; i++){
            for(int j=0; j<array[i].length; j++){
                int distance = Math.max(Math.abs(x-i), Math.abs(y-j));
                if (distance <= range) {
                    array[i][j] += decayHeat(decay, heatVal, distance);
                }
            }
        }

        return true;
    }

    public int[][] getHeats(){
        return array;
    }

    public int getHeat(int x, int y){
        return array[x][y];
    }

    public int getNetHeat(){
        int Heat=0;
        for (int i=0; i<array.length; i++){
            for (int j=0; j<array[i].length; j++) {
                Heat += array[j][i];
            }
        }
        return Heat;
    }

    private int decayHeat(double decay, int heat, int distance) {
        return (int) (heat * Math.exp(-1 * decay * distance));
    }

    public static void main(String[] args){
        HeatGrid myHeatGrid = new HeatGrid(10,10);

        myHeatGrid.placeSource("g",9,8);
        myHeatGrid.placeSource("c",5,5);
        for(int i=0; i<myHeatGrid.array.length; i++){
            for(int j=0; j<myHeatGrid.array[i].length; j++){
                System.out.print (myHeatGrid.array[i][j] + " ");
                if(j == myHeatGrid.array.length-1){
                    System.out.println("");
                }
            }

        }

    }

}
