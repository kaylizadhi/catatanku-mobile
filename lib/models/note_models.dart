class NoteModels {
  String? model;
  int? pk;
  Fields? fields;

  NoteModels({this.model, this.pk, this.fields}
  );

  NoteModels.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields = json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    return data;
  }
}

class Fields {
  String? title;
  String? text;
  String? date;

  Fields(
    {this.title, this.text, this.date}
  );

  Fields.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['text'] = this.text;
    data['date'] = this.date;
    return data;
  }
}