import time
import numpy as np
import matplotlib.pyplot as plt
from gatling_driver import DMDController, ADCInterface # Placeholder for your custom FPGA wrappers

# --- CONFIGURATION ---
DMD_PATCH_SIZE = 1000 # Number of mirrors in our test patch
STEP_SIZE = 50        # How many mirrors to add per step
EXPOSURE_TIME = 0.1   # Time to wait for ADC to stabilize (seconds)

def run_linearity_test():
    dmd = DMDController()
    adc = ADCInterface()
    
    results = []
    mirror_counts = range(0, DMD_PATCH_SIZE + 1, STEP_SIZE)

    print("--- GATLING V1: LINEARITY CALIBRATION START ---")
    print("Goal: Prove that Optical Intensity scales linearly with Flipper State.")

    for count in mirror_counts:
        # 1. Update the 'Weight' (W) by flipping 'count' mirrors to ON
        dmd.set_active_mirrors(count)
        
        # 2. Allow photons to stabilize
        time.sleep(EXPOSURE_TIME)
        
        # 3. Sample the ADC (The 'y' result)
        voltage = adc.read_channel(0)
        results.append(voltage)
        
        print(f"Mirrors: {count} | Voltage: {voltage:.4f}V")

    # --- DATA ANALYSIS ---
    plt.figure(figsize=(10, 6))
    plt.plot(mirror_counts, results, 'o-', color='purple', label='Measured Photons')
    plt.xlabel('Number of Active Mirrors (W)')
    plt.ylabel('ADC Voltage (y)')
    plt.title('Gatling V1: Photonic Linearity Proof')
    plt.grid(True)
    plt.legend()
    
    # Save for the Patreon Update
    plt.savefig('docs/assets/linearity_proof_graph.png')
    print("--- TEST COMPLETE: Graph saved to docs/assets/ ---")

if __name__ == "__main__":
    run_linearity_test()
