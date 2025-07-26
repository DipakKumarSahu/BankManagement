package businessLogic;

import java.sql.Timestamp;

public class Transaction {
    private int id;
    private String acno;
    private String receiverAcno;
    private float amount;
    private Timestamp date;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getAcno() { return acno; }
    public void setAcno(String acno) { this.acno = acno; }

    public String getReceiverAcno() { return receiverAcno; }
    public void setReceiverAcno(String receiverAcno) { this.receiverAcno = receiverAcno; }

    public float getAmount() { return amount; }
    public void setAmount(float amount) { this.amount = amount; }

    public Timestamp getDate() { return date; }
    public void setDate(Timestamp date) { this.date = date; }
}
