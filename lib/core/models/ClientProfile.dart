class ClientProfile {
  final int relationshipsCount;
  final int credentialsCount;
  final int proofsCount;
  final int issuesCount;
  final String did;
  final String label;

  ClientProfile(
      {this.did,
      this.credentialsCount,
      this.relationshipsCount,
      this.proofsCount,
      this.issuesCount,
      this.label});

  factory ClientProfile.fromJson(Map<String, dynamic> json) {
    return ClientProfile(
        did: json['did'],
        relationshipsCount: json['relCount'],
        credentialsCount: json['credsCount'],
        proofsCount: json['proofsCount'],
        issuesCount: json['issuesCount'],
        label: json['label']);
  }
}
