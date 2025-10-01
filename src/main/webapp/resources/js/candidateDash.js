// Simplified Election Candidate Dashboard JavaScript

// Candidate Data
const candidateData = {
  "candidate": {
    "id": 1,
    "name": "Rajesh Kumar Sharma",
    "profilePicture": "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
    "address": {
      "street": "123 Gandhi Road",
      "city": "New Delhi",
      "state": "Delhi", 
      "pincode": "110001",
      "full": "123 Gandhi Road, New Delhi, Delhi - 110001"
    },
    "constituency": "New Delhi Constituency",
    "party": {
      "name": "Indian National Party",
      "shortName": "INP",
      "logo": "https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=80&h=80&fit=crop",
      "color": "#FF6B35"
    },
    "phone": "+91-9876543210",
    "email": "rajesh.sharma@inp.org.in"
  },
  "activeElection": {
    "id": 101,
    "type": "Lok Sabha General Election",
    "year": 2024,
    "phase": "Phase 3",
    "votingDate": "2024-05-25",
    "resultDate": "2024-06-04",
    "status": "Campaign Active",
    "constituency": {
      "name": "New Delhi",
      "code": "PC07",
      "totalVoters": 1456789,
      "pollingStations": 1247,
      "area": "22.75 sq km"
    },
    "campaignDetails": {
      "startDate": "2024-03-10",
      "endDate": "2024-05-23", 
      "ralliesCompleted": 45,
      "ralliesPlanned": 12,
      "doorsKnocked": 25670,
      "volunteerCount": 2340
    }
  }
};

// Initialize Dashboard
document.addEventListener('DOMContentLoaded', function() {
    populateData();
    setupEventListeners();
});

// Setup basic event listeners
function setupEventListeners() {
    // Add hover effect to logout button
    const logoutBtn = document.querySelector('.btn-outline-primary');
    if (logoutBtn) {
        logoutBtn.addEventListener('mouseenter', function() {
            this.classList.add('btn-primary');
            this.classList.remove('btn-outline-primary');
        });
        
        logoutBtn.addEventListener('mouseleave', function() {
            this.classList.add('btn-outline-primary');
            this.classList.remove('btn-primary');
        });
    }
    
    // Add card hover effects
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });
}

// Populate dashboard with data
function populateData() {
    populateProfile();
    populateElectionDetails();
}

// Populate profile section
function populateProfile() {
    const candidate = candidateData.candidate;
    
    // Basic info
    setElementText('candidateName', candidate.name);
    setElementText('fullName', candidate.name);
    setElementText('constituency', candidate.constituency);
    setElementText('phone', candidate.phone);
    setElementText('email', candidate.email);
    setElementText('fullAddress', candidate.address.full);
    
    // Profile picture
    const profileImg = document.getElementById('profilePicture');
    if (profileImg && candidate.profilePicture) {
        profileImg.src = candidate.profilePicture;
        profileImg.onerror = function() {
            this.src = 'data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'150\' height=\'150\' viewBox=\'0 0 150 150\'%3E%3Ccircle cx=\'75\' cy=\'75\' r=\'75\' fill=\'%23e0e7ff\'/%3E%3Ccircle cx=\'75\' cy=\'60\' r=\'25\' fill=\'%234f46e5\'/%3E%3Cellipse cx=\'75\' cy=\'125\' rx=\'35\' ry=\'20\' fill=\'%234f46e5\'/%3E%3C/svg%3E';
        };
    }
    
    // Party info
    setElementText('partyName', candidate.party.name);
    setElementText('partyShortName', candidate.party.shortName);
    
    // Party logo
    const partyImg = document.getElementById('partyLogo');
    if (partyImg && candidate.party.logo) {
        partyImg.src = candidate.party.logo;
        partyImg.onerror = function() {
            this.src = 'data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'80\' height=\'80\' viewBox=\'0 0 80 80\'%3E%3Crect width=\'80\' height=\'80\' fill=\'%23FF6B35\' rx=\'8\'/%3E%3Ctext x=\'40\' y=\'48\' text-anchor=\'middle\' fill=\'white\' font-family=\'Arial\' font-size=\'20\' font-weight=\'bold\'%3E' + candidate.party.shortName + '%3C/text%3E%3C/svg%3E';
        };
    }
}

// Populate election details
function populateElectionDetails() {
    const election = candidateData.activeElection;
    
    // Election header
    setElementText('electionType', `${election.type} ${election.year}`);
    setElementText('electionPhase', election.phase);
    setElementText('electionStatus', election.status);
    setElementText('votingDate', formatDate(election.votingDate));
    setElementText('resultDate', formatDate(election.resultDate));
    
    // Constituency details
    setElementText('constituencyName', election.constituency.name);
    setElementText('constituencyCode', election.constituency.code);
    setElementText('constituencyArea', election.constituency.area);
    setElementText('pollingStations', formatNumber(election.constituency.pollingStations));
    setElementText('totalVoters', formatNumber(election.constituency.totalVoters));
    
    // Campaign progress
    const campaign = election.campaignDetails;
    const totalRallies = campaign.ralliesCompleted + campaign.ralliesPlanned;
    const progressPercentage = Math.round((campaign.ralliesCompleted / totalRallies) * 100);
    
    setElementText('ralliesCompleted', campaign.ralliesCompleted);
    setElementText('totalRallies', totalRallies);
    setElementText('doorsKnocked', formatNumber(campaign.doorsKnocked));
    setElementText('volunteerCount', formatNumber(campaign.volunteerCount));
    
    // Update progress bar
    const progressBar = document.getElementById('ralliesProgress');
    if (progressBar) {
        progressBar.style.width = progressPercentage + '%';
        progressBar.setAttribute('aria-valuenow', progressPercentage);
        progressBar.title = `${progressPercentage}% completed`;
    }
}

// Utility functions
function setElementText(id, text) {
    const element = document.getElementById(id);
    if (element) {
        element.textContent = text;
    }
}

function setElementSrc(id, src) {
    const element = document.getElementById(id);
    if (element) {
        element.src = src;
    }
}

function formatDate(dateString) {
    const date = new Date(dateString);
    const options = { 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric' 
    };
    return date.toLocaleDateString('en-IN', options);
}

function formatNumber(number) {
    return new Intl.NumberFormat('en-IN').format(number);
}

// API-ready functions for dynamic updates (Spring Boot integration)
function updateCandidateProfile(newData) {
    candidateData.candidate = { ...candidateData.candidate, ...newData };
    populateProfile();
}

function updateElectionDetails(newData) {
    candidateData.activeElection = { ...candidateData.activeElection, ...newData };
    populateElectionDetails();
}

function refreshDashboard() {
    populateData();
}

// Add smooth scrolling for better UX
function smoothScrollTo(elementId) {
    const element = document.getElementById(elementId);
    if (element) {
        element.scrollIntoView({ 
            behavior: 'smooth',
            block: 'start'
        });
    }
}

// Add fade-in animation to cards
function animateCards() {
    const cards = document.querySelectorAll('.card');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    });
    
    cards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
    });
}

// Initialize animations when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    setTimeout(animateCards, 100);
});

// Export functions for external access (Spring Boot can call these)
window.DashboardAPI = {
    updateCandidateProfile,
    updateElectionDetails,
    refreshDashboard,
    smoothScrollTo
};

// Add console message for developers
console.log('Simplified Election Candidate Dashboard loaded successfully');
console.log('Available API functions:', Object.keys(window.DashboardAPI));