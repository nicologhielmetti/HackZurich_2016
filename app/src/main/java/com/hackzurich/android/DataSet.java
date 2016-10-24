package com.hackzurich.android;

import java.util.ArrayList;

/**
 * Created by ingamedeo on 17/09/16.
 */
public class DataSet {

    //Using fields as described in doc.
    public static class DataUnit {

        public DataUnit(long driverID, int BEHAVE_ACC_X_PEAK, int MDI_RPM_MAX, int MDI_OVERSPEED_COUNTER) {
            this.driverID = driverID;
            this.BEHAVE_ACC_X_PEAK = BEHAVE_ACC_X_PEAK;
            this.MDI_RPM_MAX = MDI_RPM_MAX;
            this.MDI_OVERSPEED_COUNTER = MDI_OVERSPEED_COUNTER;
        }

        private long driverID;
        private int BEHAVE_ACC_X_PEAK;
        private int MDI_RPM_MAX;
        private int MDI_OVERSPEED_COUNTER;

        public long getDriverID() {
            return driverID;
        }

        public int get_BEHAVE_ACC_X_PEAK() {
            return BEHAVE_ACC_X_PEAK;
        }

        public int get_MDI_RPM_MAX() {
            return MDI_RPM_MAX;
        }

        public int get_MDI_OVERSPEED_COUNTER() {
            return MDI_OVERSPEED_COUNTER;
        }

        public double[] toDoubleArray() {
            return new double[] {BEHAVE_ACC_X_PEAK, MDI_RPM_MAX, MDI_OVERSPEED_COUNTER};
        }
    }

    private static int randNumber(int lower, int upper) {
        int r = (int) (Math.random() * (upper - lower)) + lower;
        return r;
    }

    private static ArrayList<DataUnit> generateAvgData() {

        ArrayList<DataUnit> dataUnit = new ArrayList<>();

        for (int i=0; i<100; i++) {
            //peak acc, engine rpm, overspeed detection
            dataUnit.add(new DataUnit(i, randNumber(1000, 1400), randNumber(1000, 2200), randNumber(0, 4)));
        }

        return dataUnit;
    }

    public static ArrayList<DataUnit> generateDataArray() {
        ArrayList<DataUnit> dataUnit = generateAvgData();

        //Add special data
        dataUnit.add(new DataUnit(dataUnit.size(), randNumber(2000, 3400), randNumber(2200, 3000), randNumber(5, 20)));

        return dataUnit;
    }

    private long identValTuple(int acc, int rpm, int overspeed) {
        return acc+rpm+overspeed*1000;
    }

    public static ArrayList<ArrayList<DataUnit>> kMeansCluster(ArrayList<DataUnit> dataUnit) {

        ArrayList<ArrayList<DataUnit> > output = new ArrayList<>();

        return output;
    }
}


/*
        Dataset data = new DefaultDataset();

        Log.i(Constants.TAG, "Starting clustering...");

        for (DataUnit unit : dataUnit) {
            //Instance instance = new DenseInstance(new double[] {arr[0]}, unit.getDriverID());
            Instance instance = new DenseInstance(unit.toDoubleArray(), unit.getDriverID());
            data.add(instance);
        }

        Log.i(Constants.TAG, "DataSet ready. Calling java-ml");

        Clusterer km = new KMedoids(2, 100, new DistanceMeasure() {
            @Override
            public double measure(Instance instance, Instance instance1) {
                return Math.sqrt( Math.pow(instance.value(0)-instance1.value(0),2) + Math.pow(instance.value(1)-instance1.value(1),2) + Math.pow(instance.value(2)-instance1.value(2),2) );
            }

            @Override
            public boolean compare(double v, double v1) {
                return v<v1;
            }

            @Override
            public double getMinValue() {
                return 0;
            }

            @Override
            public double getMaxValue() {
                return 0;
            }
        }); //2 clusters

Dataset[] clusters = km.cluster(data);

for (int w=0; w<clusters.length; w++) {

        Dataset cluster = clusters[w];

        ArrayList<DataUnit> dataUnits = new ArrayList<>();

        Log.i(Constants.TAG, "*** NEW Cluster ***");

        for (int i=0; i < cluster.size(); i++) {
        Instance instance = cluster.get(i);
        Double[] array = instance.values().toArray(new Double[instance.values().size()]);
        if (array.length==3)
        dataUnits.add(new DataUnit((long)instance.classValue(), array[0].intValue(), array[1].intValue(), array[2].intValue()));
        //dataUnits.add(new DataUnit((long)instance.classValue(), array[0].intValue(), 0, 0));

        }

        output.add(dataUnits);
        }
*/