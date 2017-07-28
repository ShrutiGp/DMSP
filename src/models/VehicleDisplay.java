package models;


public class VehicleDisplay {

    private int id;
    private String perf_by;
    private String time;
    private String description;


    public int getId()
    {
        return id;
    }
    public void setId(int id) { this.id=id;}

    public String getPerf()
    {
        return perf_by;
    }
    public void setPerf(String perf_by) { this.perf_by = perf_by;}

    public String getTime()
    {
        return time;
    }
    public void setTime(String time) { this.time = time;}

    public String getDesc()
    {
        return description;
    }
    public void setDesc(String description) { this.description = description;}

}
