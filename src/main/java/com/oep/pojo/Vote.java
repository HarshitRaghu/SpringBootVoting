package com.oep.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(
    name = "vote",
    uniqueConstraints = @UniqueConstraint(columnNames = {"voter_id", "election_id"})
)
public class Vote {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int vote_id;

                                                                            // Many votes can belong to one voter
    @ManyToOne
    @JoinColumn(name = "voter_id", nullable = false)  
    private Voter voter;

                                                                             // Many votes can belong to one candidate
    @ManyToOne
    @JoinColumn(name = "candidate_id", nullable = false)
    private Candidate candidate;

                                                                              // Many votes can belong to one election
    @ManyToOne
    @JoinColumn(name = "election_id", nullable = false)
    private Election election;

    
    public Vote() {
    }

   
    public Vote(Voter voter, Candidate candidate, Election election) {
        this.voter = voter;
        this.candidate = candidate;
        this.election = election;
    }

                                                                                   // Getters and Setters
    public int getVote_id() {
        return vote_id;
    }

    public void setVote_id(int vote_id) {
        this.vote_id = vote_id;
    }

    public Voter getVoter() {
        return voter;
    }

    public void setVoter(Voter voter) {
        this.voter = voter;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public Election getElection() {
        return election;
    }

    public void setElection(Election election) {
        this.election = election;
    }

    @Override
    public String toString() {
        return "Vote [vote_id=" + vote_id +
               ", voter=" + voter +
               ", candidate=" + candidate +
               ", election=" + election + "]";
    }
} 
