base:
   '*':
      - base.base
   'NJ-M-FSCS':
      - match: nodegroup
      - M_node.fscsservice
   'NJ-L-FSCS':
      - match: nodegroup
      - L_node.fscsservice
   'NJ-K-FSCS':
      - match: nodegroup
      - K_node.fscsservice
   'NJ-Q-FSCS':
      - match: nodegroup
      - Q_node.fscsservice
   'NJ-S-FSCS':
      - match: nodegroup
      - S_node.fscsservice
   'NJ-R-FSCS':
      - match: nodegroup
      - R_node.fscsservice
   'NJ-H-FSCS':
      - match: nodegroup
      - H_node.fscsservice
   'NJ-M-FC':
      - match: nodegroup
      - M_node.fcservice
   'NJ-L-FC':
      - match: nodegroup
      - L_node.fcservice
   'NJ-K-FC':
      - match: nodegroup
      - K_node.fcservice
   'NJ-Q-FC':
      - match: nodegroup
      - Q_node.fcservice
   'NJ-S-FC':
      - match: nodegroup
      - S_node.fcservice
   'NJ-R-FC':
      - match: nodegroup
      - R_node.fcservice
   'NJ-H-FC':
      - match: nodegroup
      - R_node.fcservice
   'FSCS':
      - match: nodegroup
      - fscsinit.fcscsinit
      - fscsinit.update
      - fscsservice.service
   'FC':
      - match: nodegroup
      - fcinit.fcinit
      - fcinit.update
      - fcservice.service 
   'CAN-GE-windows8':
      - windows.shencan
