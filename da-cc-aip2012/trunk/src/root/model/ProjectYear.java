package root.model;

public enum ProjectYear {
    Y2002(2002), Y2003(2003), Y2004(2004), Y2005(2005), Y2006(2006), Y2007(2007), Y2008(
            2008), Y2009(2009), Y2010(2010), Y2011(2011), Y2012(2012);

    private int year;

    private ProjectYear(int year) {
        this.year = year;
    }

    public String toString() {
        return String.valueOf(year);
    }

    public static ProjectYear byYear(int year) {
        return ProjectYear.valueOf("Y" + year);
    }

}
