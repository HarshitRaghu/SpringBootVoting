// Election Voter Dashboard JavaScript

// Voter and Election Data
const voterData = {
  "voter": {
    "id": 1,
    "name": "Anjali Verma",
    "address": {
      "street": "23 Patel Nagar",
      "city": "Lucknow",
      "state": "Uttar Pradesh",
      "pincode": "226001",
      "full": "23 Patel Nagar, Lucknow, Uttar Pradesh - 226001"
    },
    "voterId": "UPL123456789",
    "phone": "+91-9876543210",
    "email": "anjali.verma@email.com"
  },
  "activeElections": [
    {
      "id": 201,
      "type": "Assembly Election 2025",
      "constituency": "Lucknow Central",
      "date": "2025-02-15",
      "candidates": [
        {
          "candidateId": "A101",
          "name": "Ashok Kumar Tripathi",
          "party": {
            "name": "Samajwadi Party",
            "shortName": "SP",
            "logo": "https://images.unsplash.com/photo-1589830664175-66a0927c34db?w=80&h=80&fit=crop",
            "color": "#FF0000"
          }
        },
        {
          "candidateId": "A102",
          "name": "Priya Singh",
          "party": {
            "name": "Bharatiya Janata Party",
            "shortName": "BJP",
            "logo": "https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=80&h=80&fit=crop",
            "color": "#FF6600"
          }
        },
        {
          "candidateId": "A103",
          "name": "Rakesh Pandey",
          "party": {
            "name": "Indian National Congress",
            "shortName": "INC",
            "logo": "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=80&h=80&fit=crop",
            "color": "#0066FF"
          }
        }
      ]
    },
    {
      "id": 202,
      "type": "Mayor Election 2025",
      "constituency": "Lucknow City",
      "date": "2025-03-20",
      "candidates": [
        {
          "candidateId": "M201",
          "name": "Sunita Agarwal",
          "party": {
            "name": "Aam Aadmi Party",
            "shortName": "AAP",
            "logo": "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=80&h=80&fit=crop",
            "color": "#0099CC"
          }
        },
        {
          "candidateId": "M202",
          "name": "Manoj Kumar Tiwari",
          "party": {
            "name": "Bharatiya Janata Party",
            "shortName": "BJP",
            "logo": "https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=80&h=80&fit=crop",
            "color": "#FF6600"
          }
        },
        {
          "candidateId": "M203",
          "name": "Deepak Sharma",
          "party": {
            "name": "Bahujan Samaj Party",
            "shortName": "BSP",
            "logo": "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop",
            "color": "#0000FF"
          }
        }
      ]
    }
  ]
};

// DOM Elements
let electionSelect;
let electionDetails;
let candidatesSection;
let candidatesList;

// Initialize Dashboard
document.addEventListener('DOMContentLoaded', function() {
    console.log('Dashboard initializing...');
    
    // Small delay to ensure DOM is fully loaded
    setTimeout(function() {
        try {
            initializeElements();
            populateVoterInfo();
            populateElectionDropdown();
            setupEventListeners();
            console.log('Dashboard initialized successfully');
        } catch (error) {
            console.error('Error initializing dashboard:', error);
        }
    }, 100);
});

// Initialize DOM elements
function initializeElements() {
    electionSelect = document.getElementById('electionSelect');
    electionDetails = document.getElementById('electionDetails');
    candidatesSection = document.getElementById('candidatesSection');
    candidatesList = document.getElementById('candidatesList');
    
    console.log('Elements found:', {
        electionSelect: !!electionSelect,
        electionDetails: !!electionDetails,
        candidatesSection: !!candidatesSection,
        candidatesList: !!candidatesList
    });
}

// Setup event listeners
function setupEventListeners() {
    if (electionSelect) {
        electionSelect.addEventListener('change', handleElectionSelection);
        console.log('Event listener added to election select');
    } else {
        console.error('Election select element not found!');
    }
}

// Populate voter information
function populateVoterInfo() {
    const voter = voterData.voter;
    
    // Set voter details
    setElementText('voterName', voter.name);
    setElementText('voterId', voter.voterId);
    setElementText('voterAddress', voter.address.full);
    setElementText('voterPhone', voter.phone);
    
    console.log('Voter info populated');
}

// Populate election dropdown
function populateElectionDropdown() {
    console.log('Populating election dropdown...');
    
    if (!electionSelect) {
        console.error('Election select element not found!');
        return;
    }
    
    try {
        // Clear existing options except the first one
        electionSelect.innerHTML = '<option value="">-- Select an Election --</option>';
        
        // Add elections to dropdown
        voterData.activeElections.forEach(election => {
            const option = document.createElement('option');
            option.value = election.id.toString();
            option.textContent = `${election.type} - ${election.constituency}`;
            electionSelect.appendChild(option);
            console.log('Added option:', option.textContent);
        });
        
        console.log('Election dropdown populated with', voterData.activeElections.length, 'elections');
        console.log('Dropdown HTML:', electionSelect.innerHTML);
        
    } catch (error) {
        console.error('Error populating election dropdown:', error);
    }
}

// Handle election selection
function handleElectionSelection(event) {
    console.log('Election selection changed:', event.target.value);
    
    const selectedElectionId = parseInt(event.target.value);
    
    if (!selectedElectionId) {
        hideElectionDetails();
        hideCandidates();
        return;
    }
    
    const selectedElection = voterData.activeElections.find(
        election => election.id === selectedElectionId
    );
    
    if (selectedElection) {
        console.log('Selected election:', selectedElection.type);
        showElectionDetails(selectedElection);
        showCandidates(selectedElection.candidates);
    } else {
        console.error('Election not found for ID:', selectedElectionId);
    }
}

// Show election details
function showElectionDetails(election) {
    if (!electionDetails) {
        console.error('Election details element not found!');
        return;
    }
    
    setElementText('selectedElectionTitle', election.type);
    setElementText('selectedConstituency', election.constituency);
    setElementText('selectedVotingDate', formatDate(election.date));
    
    electionDetails.style.display = 'block';
    console.log('Election details shown');
}

// Hide election details
function hideElectionDetails() {
    if (electionDetails) {
        electionDetails.style.display = 'none';
        console.log('Election details hidden');
    }
}

// Show candidates
function showCandidates(candidates) {
    if (!candidatesSection || !candidatesList) {
        console.error('Candidates section elements not found!');
        return;
    }
    
    console.log('Showing', candidates.length, 'candidates');
    
    // Clear existing candidates
    candidatesList.innerHTML = '';
    
    // Create candidate cards
    candidates.forEach((candidate, index) => {
        const candidateCard = createCandidateCard(candidate, index);
        candidatesList.appendChild(candidateCard);
    });
    
    // Show candidates section
    candidatesSection.style.display = 'block';
    
    // Scroll to candidates section smoothly
    setTimeout(() => {
        candidatesSection.scrollIntoView({ 
            behavior: 'smooth', 
            block: 'start' 
        });
    }, 300);
    
    console.log('Candidates displayed and scrolled into view');
}

// Hide candidates
function hideCandidates() {
    if (candidatesSection) {
        candidatesSection.style.display = 'none';
        console.log('Candidates section hidden');
    }
}

// Create candidate card
function createCandidateCard(candidate, index) {
    console.log('Creating card for candidate:', candidate.name);
    
    const col = document.createElement('div');
    col.className = 'col-lg-4 col-md-6 mb-4';
    
    const card = document.createElement('div');
    card.className = 'candidate-card';
    card.style.animationDelay = `${(index + 1) * 0.1}s`;
    
    card.innerHTML = `
        <div class="candidate-header">
            <div class="logo-container">
                <img src="${candidate.party.logo}" 
                     alt="${candidate.party.shortName} Logo" 
                     class="party-logo"
                     onerror="handleLogoError(this, '${candidate.party.shortName}', '${candidate.party.color || '#666666'}')">
            </div>
            <div class="candidate-info">
                <h4>${candidate.name}</h4>
                <div class="candidate-id">ID: ${candidate.candidateId}</div>
            </div>
        </div>
        
        <div class="party-info">
            <div class="party-name">
                <i class="fas fa-flag me-2"></i>${candidate.party.name}
            </div>
            <div class="party-short">${candidate.party.shortName}</div>
        </div>
        
        <div class="vote-action">
            <button class="btn-vote" onclick="console.log('Vote clicked for ${candidate.name}')">
                <i class="fas fa-vote-yea"></i>
                Vote for ${candidate.name}
            </button>
        </div>
    `;
    
    col.appendChild(card);
    return col;
}

// Handle logo loading errors
function handleLogoError(img, shortName, color) {
    console.log('Logo failed to load for:', shortName);
    
    // Create fallback div
    const fallbackDiv = document.createElement('div');
    fallbackDiv.className = 'party-logo d-flex align-items-center justify-content-center';
    fallbackDiv.style.backgroundColor = color;
    fallbackDiv.style.color = 'white';
    fallbackDiv.style.fontWeight = 'bold';
    fallbackDiv.style.fontSize = '14px';
    fallbackDiv.textContent = shortName;
    
    // Replace the image with the fallback div
    img.parentNode.replaceChild(fallbackDiv, img);
}

// Utility functions
function setElementText(id, text) {
    const element = document.getElementById(id);
    if (element) {
        element.textContent = text;
        return true;
    } else {
        console.warn('Element not found:', id);
        return false;
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

// API-ready functions for dynamic updates (for future backend integration)
function updateVoterInfo(newVoterData) {
    voterData.voter = { ...voterData.voter, ...newVoterData };
    populateVoterInfo();
}

function updateElections(newElections) {
    voterData.activeElections = newElections;
    populateElectionDropdown();
    
    // Reset selection
    if (electionSelect) {
        electionSelect.value = '';
    }
    hideElectionDetails();
    hideCandidates();
}

function addElection(newElection) {
    voterData.activeElections.push(newElection);
    populateElectionDropdown();
}

function removeElection(electionId) {
    voterData.activeElections = voterData.activeElections.filter(
        election => election.id !== electionId
    );
    populateElectionDropdown();
    
    // If currently selected election is removed, reset
    if (electionSelect && parseInt(electionSelect.value) === electionId) {
        electionSelect.value = '';
        hideElectionDetails();
        hideCandidates();
    }
}

// Refresh dashboard data
function refreshDashboard() {
    populateVoterInfo();
    populateElectionDropdown();
    
    // Reset selection
    if (electionSelect) {
        electionSelect.value = '';
    }
    hideElectionDetails();
    hideCandidates();
}

// Export functions for external access (for future backend integration)
window.VoterDashboardAPI = {
    updateVoterInfo,
    updateElections,
    addElection,
    removeElection,
    refreshDashboard,
    getVoterData: () => voterData,
    getCurrentSelection: () => electionSelect ? electionSelect.value : null
};

// Make handleLogoError available globally
window.handleLogoError = handleLogoError;

// Debug functions (can be called from browser console)
window.debugDashboard = {
    showAllData: () => console.log(voterData),
    showVoter: () => console.log(voterData.voter),
    showElections: () => console.log(voterData.activeElections),
    selectElection: (id) => {
        if (electionSelect) {
            electionSelect.value = id.toString();
            electionSelect.dispatchEvent(new Event('change'));
        }
    },
    testDropdown: () => {
        if (electionSelect) {
            console.log('Dropdown element:', electionSelect);
            console.log('Dropdown options count:', electionSelect.options.length);
            console.log('Dropdown HTML:', electionSelect.innerHTML);
        } else {
            console.error('Dropdown not found!');
        }
    }
};