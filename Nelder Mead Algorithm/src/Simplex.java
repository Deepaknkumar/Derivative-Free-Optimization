import java.util.ArrayList;

/**
 * Created by Deepak Kumar on 2/2/2017.
 */
public class Simplex {
    public PointND[] points; // = new ArrayList<PointND>();

    public Simplex(PointND[] points){              // General constructor

        this.points = points;
    }

    public Simplex(double theta){                   // Constructor specific for q5_9
        this.points = ComputeSimplexQ5_9(theta);
    }

    private PointND[] ComputeSimplexQ5_9(double theta){
        PointND[] tmpPointArr = new PointND[3];
        for(int i=0;i<tmpPointArr.length;i++){      // Initialization of each N dimension point with empty vector
            tmpPointArr[i] = new PointND(2);
        }
        tmpPointArr[0].point = new double[]{0.0,0.0};
        tmpPointArr[1].point = new double[]{Math.cos(Math.toRadians(theta)),Math.sin(Math.toRadians(theta))};
        tmpPointArr[2].point = new double[]{Math.cos(Math.toRadians(theta)),-Math.sin(Math.toRadians(theta))};
        return tmpPointArr;
    }

    public PointND ComputeCentroid(){
        PointND centroid;
        PointND tmpSum = new PointND(points.length-1);
        for(int i=0;i<points.length-1;i++){
            tmpSum = tmpSum.ComputeSum(points[i]);
        }
        tmpSum.ComputeMultiplication(1.0/(points.length-1));
        centroid = tmpSum;
        return centroid;
    }

    public double ComputeVolume(Simplex Y){

        return 0;
    }

    public double FindDiameter(Simplex Y){

        return 0;
    }

    public double ComputeNormalizedVolume(Simplex Y){

        return 0;
    }

}