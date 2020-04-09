package models;

import java.util.Date;


/**
 * 
 * @author Allari Edoardo
 * @version 1.0.0 - 14/03/2020
 * 
 */

public class Commento{


    private long Id;

    private Date DataOra;

    private String Testo;

    private String Titolo;

    private Utente utente;

    private Post post;

    public Commento() {
    }

    public Commento(long id, Date dataOra, String testo, String titolo, Utente utente, Post post) {
        this.Id = id;
        this.DataOra = dataOra;
        this.Testo = testo;
        this.Titolo = titolo;
        this.utente = utente;
        this.post = post;
    }

    public long getId() {
        return Id;
    }

    public void setId(long id) {
        Id = id;
    }

    public Date getDataOra() {
        return DataOra;
    }

    public void setDataOra(Date dataOra) {
        DataOra = dataOra;
    }

    public String getTesto() {
        return Testo;
    }

    public void setTesto(String testo) {
        Testo = testo;
    }

    public String getTitolo() {
        return Titolo;
    }

    public void setTitolo(String titolo) {
        Titolo = titolo;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}