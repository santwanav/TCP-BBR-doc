# Understanding the BBR Flow

The BBR algorithm is a state machine with the following 4 main states:
* Startup Phase
* Drain Phase
* ProbeBW Phase
* ProbeRTT Phase

## Startup Phase

* The sending rate is double **every RTT** using a pacing gain of 2.885.
* The inflight cap is set to 3*BDP.
* If the Delivery rate does not increase more that 25% in three
		consecutive rounds, it exits the startup phase and enters the drain
		phase.

## Drain Phase

* This phase drains out the excess queue that might have built up due to the startup phase.
* Pacing gain of 1/2.885 (i.e 0.35) is used.
* Exits as soon as data inflight becomes equal to BDP.

## ProbeBW Phase

* BBR spends majority of the time in this phase.
* Pacing gain follows a cycle of [1.25, 0.75, 1, 1, 1, 1, 1, 1].
* 1.25 to send more date to check if the bottleneck bandwidth has increased.
* 0.75 to drain the potential queue it might have caused.

## ProbeRTT Phase

* Entered only if the RTT hasn't been updated with a lower value than
		before for the last 10s.
* The inflight data is limited to 4 packets for time = max (RTT, 200ms)
* Since the most queue has been drained, the RTT estimated is the
		RTT<sub>min</sub>.
