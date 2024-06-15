enum Aval {
  p1,
  p2,
  p3,
  p4,
  t1,
  t2,
  t3,
}

extension AvalExtension on Aval{
  String get displayName{
    switch (this){
      case Aval.p1:
        return 'P1';
      case Aval.p2:
        return 'P2';
      case Aval.p3:
        return 'P3';
      case Aval.p4:
        return 'P4';
      case Aval.t1:
        return 'T1';
      case Aval.t2:
        return 'T2';
      case Aval.t3:
        return 'T3';
      default:
        return '';
    }
  }
}
